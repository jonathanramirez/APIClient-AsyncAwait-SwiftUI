//
//  APIClientAsyncAwaitSwiftUIApp.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

@main
struct APIClientAsyncAwaitSwiftUIApp: App {
    @StateObject private var model = MainListModel(service: ProductClient())

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(model)

        }
    }
}
