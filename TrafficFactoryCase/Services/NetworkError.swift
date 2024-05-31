//
//  NetworkError.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case serializationError(Error)
    case unauthorized
    case serverError(statusCode: Int)
}
