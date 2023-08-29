//
//  UserEndpoint.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation
@testable import APIClient

enum UserEndpoint {
    case getUser
}

extension UserEndpoint: Endpoint {

    var body: [String: Any]? {
        switch self {
        case .getUser:
            return nil
        }
    }

    var method: RequestMethod {
        switch self {
        case .getUser:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getUser:
            return "/user/"
        }
    }
}
