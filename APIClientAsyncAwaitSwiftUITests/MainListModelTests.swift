//
//  APIClientTests.swift
//  APIClientAsyncAwaitSwiftUITests
//
//  Created by Jonathan on 21.08.23.
//

import XCTest
@testable import APIClientAsyncAwaitSwiftUI
import Combine

final class MainListModelTests: XCTestCase {

    func testGetProductsData() async {
        let viewModel = MainListModel(service: ProductClientMock())
        var cancellables = Set<AnyCancellable>()
        let expectation = expectation(description: "Fetch data from service")

        viewModel.$products
            .dropFirst()
            .sink(receiveValue: {
                XCTAssertEqual($0.first?.title, "Laptops")
                expectation.fulfill()
            })
            .store(in: &cancellables)
        await viewModel.loadProducts()

        await fulfillment(of: [expectation], timeout: 0.1)
    }
}
