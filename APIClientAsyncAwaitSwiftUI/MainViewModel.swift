//
//  MainViewModel.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation

class MainListModel: ObservableObject {

    @Published var products: Products = []

    let service: ProductsClient

    init(service: ProductsClient) {
        self.service = service
    }

    @MainActor
    func loadProducts() async {
        do {
            products = try await service.getProducts()
        } catch {
            // need to handler some errors
        }
    }

    func getCurrectIndex(product: Product) -> Int? {
        products.firstIndex(where: { $0.id == product.id })
    }

    @MainActor
    func save(product: Product) async -> Bool {
        guard let currentIndex = getCurrectIndex(product: product) else { return false }
        products.remove(at: currentIndex)
        products.insert(product, at: currentIndex)

        do {
            _ = try await service.sendProduct(product: product)
            return true
        } catch {
            // need to handler some errors
            return false
        }
    }

}
