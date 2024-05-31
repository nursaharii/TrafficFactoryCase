//
//  Array+Ext.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation

extension Array: Cachable where Element: Cachable {
    static var cacheKey: String {
        return "\(Element.cacheKey)Array"
    }
}
