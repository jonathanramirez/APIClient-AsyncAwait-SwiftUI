//
//  localResources.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

protocol LocalResources: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T
}

extension LocalResources {
    var bundle: Bundle {
        Bundle(for: type(of: self))
    }

    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }

        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)

            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
}
