//
//  User.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

struct User: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
}
