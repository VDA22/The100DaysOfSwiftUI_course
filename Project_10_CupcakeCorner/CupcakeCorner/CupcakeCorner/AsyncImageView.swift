//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack(spacing: 16) {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"), scale: 4)

            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ZStack {
                    Color.red
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)

            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was en error loading the image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)

        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView()
    }
}
