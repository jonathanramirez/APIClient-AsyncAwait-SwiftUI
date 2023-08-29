//
//  MockApiClient.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation
import APIClient

struct MockApiClient: APIClient {
    var session: Networking

    func getUser() async throws -> User {
        let response: User = try await sendRequest(endpoint: UserEndpoint.getUser, session: session)
        return response
    }
}
