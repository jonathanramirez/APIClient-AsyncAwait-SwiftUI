//
//  MockURLSession.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation
@testable import APIClientAsyncAwaitSwiftUI

struct MockURLSession: Networking {

    var data: Data?
    var error: APIClientError?
    var noResponseError: URLResponse?

    var httpURLResponse: URLResponse?

    static var successResponse: URLResponse {
        HTTPURLResponse(url: URL(string: "http://www.test.com")!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)!
    }

    static var badResponse: URLResponse {
        HTTPURLResponse(url: URL(string: "http://www.test.com")!, statusCode: 404, httpVersion: "HTTP/1.1", headerFields: nil)!
    }

    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        guard error == nil else {
            throw error!
        }

        guard noResponseError == nil else {
            return (Data(), URLResponse())
        }

        guard httpURLResponse == nil else {
            return (Data(), httpURLResponse!)
        }

        guard let data  else { throw APIClientError.unknown }
        return (data, MockURLSession.successResponse)
    }
}
