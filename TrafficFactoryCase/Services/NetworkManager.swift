//
//  NetworkManager.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation

protocol NetworkDelegate {
    func getItems(completion: @escaping (Result<[Item], NetworkError>) -> ())
}

class NetworkManager: NetworkDelegate {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getItems(completion: @escaping (Result<[Item], NetworkError>) -> ()) {
        if let cachedItems = [Item].loadCachedData() {
            completion(.success(cachedItems))
            return
        }
        request(endpoint: .getItems, completion: completion)
    }
    
    private func request<T: Cachable>(endpoint: API, completion: @escaping (Result<[T], NetworkError>) -> ()) {
           guard let url = URL(string: "\(endpoint.baseURL)\(endpoint.path)") else {
               completion(.failure(.invalidURL))
               return
           }
           
           var request = URLRequest(url: url)
           request.httpMethod = endpoint.method
           request.allHTTPHeaderFields = endpoint.headers
           
           if endpoint.method == "POST" {
               do {
                   request.httpBody = try JSONSerialization.data(withJSONObject: endpoint.parameters, options: [])
               } catch let error {
                   completion(.failure(.serializationError(error)))
                   return
               }
           }
           
           let task = URLSession.shared.dataTask(with: request) { data, response, error in
               if let error = error {
                   completion(.failure(.networkError(error)))
                   return
               }
               
               guard let httpResponse = response as? HTTPURLResponse else {
                   completion(.failure(.invalidResponse))
                   return
               }
               
               switch httpResponse.statusCode {
               case 200...299:
                   guard let data = data else {
                       completion(.failure(.invalidResponse))
                       return
                   }
                   
                   do {
                       let decodedData = try JSONDecoder().decode([T].self, from: data)
                       [T].cacheData(decodedData)
                       completion(.success(decodedData))
                   } catch let error {
                       completion(.failure(.serializationError(error)))
                   }
                   
               case 401:
                   completion(.failure(.unauthorized))
                   
               default:
                   completion(.failure(.serverError(statusCode: httpResponse.statusCode)))
               }
           }
           
           task.resume()
       }
   }

