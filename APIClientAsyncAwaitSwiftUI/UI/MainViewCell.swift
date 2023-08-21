//
//  MainViewCell.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

struct MainViewCell: View {

    let product: Product

    var body: some View {
        HStack {
            LoadImageView(url: product.image)
                .frame(width: 40, height: 40)

            Text(product.title)

            Spacer()

            if product.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(
            product: Product(
                id: 0, title: "Demo"
            )
        )
    }
}
