//
//  API.swift
//  TrafficFactoryCase
//
//  Created by Nurşah Ari on 31.05.2024.
//

import Foundation

enum API {
    case getItems

    var baseURL: URL {
        return URL(string: UrlConstants.baseUrl)!
    }

    var path: String {
        switch self {
        case .getItems:
            return "/data/test.json"
        }
    }

    var method: String {
        switch self {
        case .getItems:
            return "GET"
        }
    }

    var headers: [String: String] {
        let headers = ["Content-Type" : "application/json"]
        return headers
    }

    var parameters: [String: Any] {
        switch self {
        case .getItems:
            return [:]
        }
    }
}
