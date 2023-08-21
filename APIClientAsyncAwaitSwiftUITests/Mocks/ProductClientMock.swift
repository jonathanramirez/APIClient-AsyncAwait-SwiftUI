//
//  ProductClientMock.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import Foundation
@testable import APIClientAsyncAwaitSwiftUI

final class ProductClientMock: LocalResources, ProductsClient {

    func sendProduct(product: Product) async throws -> ProductResponse {
        ProductResponse(id: 1)
    }

    func getProducts() async throws -> Products {
        loadJSON(filename: "Products", type: Products.self)
    }
}
