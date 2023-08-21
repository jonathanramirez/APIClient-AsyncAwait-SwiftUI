//
//  EditProduct.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

struct ShowMessage: Identifiable {
    var id: String { message }
    let message: String
}

struct EditProduct: View {
    @Environment(\.dismiss) var dimiss
    @EnvironmentObject var model: MainListModel
    @State var product: Product
    @State private var showMessage: ShowMessage?

    var body: some View {
        Form {
            Section(header: Text("Title Info")) {
                TextField("Title", text: $product.title)
            }
            Section("Description") {
                TextEditor(text: $product.description.optinal(defaultValue: ""))
                    .frame(height: 200)
            }

            Button {
                Task {
                    if await model.save(product: product) {
                        showMessage = ShowMessage(message: "Success")
                    } else {
                        showMessage = ShowMessage(message: "Error")
                    }
                }
            } label: {
                Text("Send")
            }

        }
        .alert(item: $showMessage) { show in
            Alert(
                title: Text("Alert"),
                message: Text(show.message),
                dismissButton: .destructive(Text("ok")) {
                    dimiss()
                }
            )
        }
    }
}
