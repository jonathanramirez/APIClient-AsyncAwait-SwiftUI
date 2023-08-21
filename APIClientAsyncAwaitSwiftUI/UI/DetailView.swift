//
//  DetailView.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

struct DetailView: View {

    @EnvironmentObject var model: MainListModel
    @State private var showEdit = false

    var product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    LoadImageView(url: product.image)
                        .frame(width: 100, height: 100)

                    Text(product.title)
                        .font(.title)

                    if let productIndex = model.getCurrectIndex(product: product) {
                        FavoriteButton(isSet: $model.products[productIndex].isFavorite )
                    }
                }

                Divider()

                Text("About \(product.title)")
                    .font(.title2)
                Text(product.description!)
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showEdit.toggle()
                } label: {
                    Text("Edit")
                }
            }
        }
        .sheet(isPresented: $showEdit, content: {
            EditProduct(product: product)
        })
        .navigationTitle("Product")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {

    static var previews: some View {
        @State var list = MainListModel(
            service: ProductClient()
        )

        DetailView(
            product: Product(id: 1,
                             title: "title of product",
                             description: "description of de product",
                             image: "image"
                            )
        )
        .environmentObject(list)
    }
}
