//
//  Encodable+extension.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

extension Encodable {

    public func toData() throws -> Data {
        try JSONEncoder().encode(self)
    }

    public func toDictionary() throws -> [String: Any]? {
        try JSONSerialization.jsonObject(
            with: try JSONEncoder().encode(self),
            options: .allowFragments
        ) as? [String: Any]
    }
}
