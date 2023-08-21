//
//  ProductClient.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

protocol ProductsClient {
    func getProducts() async throws -> Products
    func sendProduct(product: Product) async throws -> ProductResponse
}

struct ProductClient: APIClient, ProductsClient {

    func getProducts() async throws -> Products {
        let response: Products = try await sendRequest(endpoint: ProductEndpoint.getProducts)
        return response
    }

    func sendProduct(product: Product) async throws -> ProductResponse {
        let response: ProductResponse = try await sendRequest(endpoint: ProductEndpoint.sendProduct(product: product))
        return response
    }

}
