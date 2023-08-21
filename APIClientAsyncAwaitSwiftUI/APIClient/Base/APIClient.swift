//
//  APIClient.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

protocol APIClient {
    func sendRequest<T: Codable>(endpoint: Endpoint, session: Networking) async throws -> T
}

extension APIClient {
    func sendRequest<T: Codable>(endpoint: Endpoint, session: Networking = URLSession.shared) async throws -> T {

        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path

        guard let url = urlComponents.url else {
            throw APIClientError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue

        endpoint.createHeaders().forEach { (key, value) in
            if let value = value as? String {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }

        do {
            let (data, response) = try await session.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw APIClientError.noResponse
            }
            switch response.statusCode {
                case 200...299:
                    guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                        throw APIClientError.decode
                    }
                    return decodedResponse
                default:
                throw APIClientError.badResponse
            }

        } catch {
            throw error
        }
    }
}
