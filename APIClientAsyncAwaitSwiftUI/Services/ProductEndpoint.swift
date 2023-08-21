//
//  ProductEndpoint.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

enum ProductEndpoint {
    case getProducts
    case sendProduct(product: Product)
}

extension ProductEndpoint: Endpoint {

    var body: [String: Any]? {
        switch self {
        case .getProducts:
            return nil
        case .sendProduct(let product):
            return try? product.toDictionary()
        }
    }

    var method: RequestMethod {
        switch self {
        case .getProducts:
            return .get
        case .sendProduct:
            return .post
        }
    }

    var path: String {
        switch self {
        case .getProducts:
            return "/products/"
        case .sendProduct:
            return "/products/"
        }
    }
}
