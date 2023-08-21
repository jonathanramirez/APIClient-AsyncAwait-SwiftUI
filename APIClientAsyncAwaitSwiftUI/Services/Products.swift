//
//  Products.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

typealias Products = [Product]

// MARK: - Product
struct Product: Codable, Hashable, Identifiable {
    var id: Int
    var title: String
    var description: String?
    var image: String?
    var isFavorite: Bool = false

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case image
    }

}

struct ProductResponse: Codable, Hashable, Identifiable {
    var id: Int
}
