//
//  Encodable+extension.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

extension Encodable {

    func toData() throws -> Data {
        try JSONEncoder().encode(self)
    }

    func toDictionary() throws -> [String: Any]? {
        try JSONSerialization.jsonObject(
            with: try JSONEncoder().encode(self),
            options: .allowFragments
        ) as? [String: Any]
    }
}
