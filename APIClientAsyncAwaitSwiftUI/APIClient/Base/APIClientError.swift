//
//  APIClientError.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

enum APIClientError: Error {
    case invalidURL
    case noResponse
    case decode
    case unknown
    case badResponse
}
