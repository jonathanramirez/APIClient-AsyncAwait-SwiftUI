//
//  LoadImageView.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import Foundation
import SwiftUI

struct LoadImageView: View {

    let url: String?

    var body: some View {

        if let url = url {
            AsyncImage(url: URL(string: url)) { phase in
                if let image = phase.image {
                    CircleImage(image: image)
                } else if phase.error != nil {
                    Image(systemName: "icloud.slash")
                        .resizable()

                } else {
                    ProgressView().progressViewStyle(.circular)
                }
            }
        } else {
            Image(systemName: "icloud.slash")
                .resizable()

        }
    }
}
