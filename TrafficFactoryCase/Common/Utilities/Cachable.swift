//
//  Cachable.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation

protocol Cachable:Codable {
    associatedtype CacheType: Codable
    static var cacheKey: String { get }
    static func cacheData(_ data: CacheType)
    static func loadCachedData() -> CacheType?
}

extension Cachable {
    static func cacheData(_ data: Self) {
        do {
            let encodedData = try JSONEncoder().encode(data)
            UserDefaults.standard.set(encodedData, forKey: cacheKey)
        } catch {
            print("Failed to cache data: \(error)")
        }
    }
    
    static func loadCachedData() -> Self? {
        guard let cachedData = UserDefaults.standard.data(forKey: cacheKey) else {
            return nil
        }
        
        do {
            let decodedData = try JSONDecoder().decode(Self.self, from: cachedData)
            return decodedData
        } catch {
            print("Failed to load cached data: \(error)")
            return nil
        }
    }
}
