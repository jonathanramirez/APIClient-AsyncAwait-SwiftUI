//
//  CircleImage.swift
//  APIClientAsyncAwaitSwiftUI
//
//  Created by Jonathan on 21.08.23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image(systemName: "icloud.slash"))
    }
}
