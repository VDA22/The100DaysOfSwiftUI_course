//
//  ImagesView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct ImagesView: View {
    var body: some View {
        GeometryReader { geo in

            let width = geo.size.width * 0.8
            let height = (geo.size.height / 5) - 10

            VStack {
                Image("Example")
                    .frame(width: width, height: height)
                    .clipped()

                Image("Example")
                    .resizable()
                    .frame(width: 150, height: height)

                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: height)

                Image("Example")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width) // calculate height automaticly

                Image("Example")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: height)
            }
            .frame(width: geo.size.width, height: geo.size.height) // "centring" the view
        }

    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView()
    }
}
