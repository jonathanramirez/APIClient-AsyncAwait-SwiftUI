//
//  Endpoint.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
}

extension Endpoint {
    var scheme: String {
        "https"
    }

    var host: String {
        "fakestoreapi.com"
    }

    var headers: [String: String]? { [:] }

    func createHeaders() -> [String: Any] {
           var headers = ["Content-Type": "application/json"]
           if let additionalHeaders = self.headers {
               for header in additionalHeaders {
                   headers[header.key] = header.value
               }
           }
           return headers
    }
}
