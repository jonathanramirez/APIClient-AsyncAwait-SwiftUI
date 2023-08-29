//
//  APIClientTest.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import XCTest
import APIClient

final class APIClientTest: XCTestCase {

    var apiClient: MockApiClient?

    func testGetData() async {
        let user = User(id: 1, name: "Some USers")
        let userData = try? user.toData()

        apiClient = setupApiClient(session: MockURLSession(data: userData))

        let response = try? await apiClient?.getUser()
        XCTAssertEqual(response, user)
    }

    func testGetInviliadURL() async {
        apiClient = setupApiClient(session: MockURLSession(error: APIClientError.invalidURL))
        do {
            _ = try await apiClient?.getUser()
        } catch {
            XCTAssertEqual(error as! APIClientError, APIClientError.invalidURL)
        }
    }

    func testNoResponse() async {
        apiClient = setupApiClient(session: MockURLSession(noResponseError: MockURLSession.badResponse))
        do {
            _ = try await apiClient?.getUser()
        } catch {
            XCTAssertEqual(error as! APIClientError, APIClientError.noResponse)
        }
    }

    func testSuccessResponseErrorDecode() async {
        apiClient = setupApiClient(session: MockURLSession(httpURLResponse: MockURLSession.successResponse))
        do {
            _ = try await apiClient?.getUser()
        } catch {
            XCTAssertEqual(error as! APIClientError, APIClientError.decode)
        }
    }

    func testSFailResponseErrorDecode() async {
        apiClient = setupApiClient(session: MockURLSession(httpURLResponse: MockURLSession.badResponse))
        do {
            _ = try await apiClient?.getUser()
        } catch {
            XCTAssertEqual(error as! APIClientError, APIClientError.badResponse)
        }
    }

    private func setupApiClient(session: Networking) -> MockApiClient {
        MockApiClient(session: session)
    }
}
