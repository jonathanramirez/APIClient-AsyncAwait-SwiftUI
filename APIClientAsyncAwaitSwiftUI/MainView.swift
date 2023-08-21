//
//  MainView.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var model: MainListModel
    @State private var showFavoritesOnly = false

    var filtered: [Product] {
        model.products.filter { product in
            (!showFavoritesOnly || product.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filtered) { product in
                    NavigationLink(destination: DetailView(product: product)) {
                        MainViewCell(product: product)
                    }
                }
            }
        }
        .navigationTitle("List")
        .task {
            await model.loadProducts()
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
