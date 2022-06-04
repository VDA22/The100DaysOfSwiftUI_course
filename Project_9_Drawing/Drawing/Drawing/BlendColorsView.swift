//
//  BlendColorsView.swift
//  Drawing
//
//  Created by Darya Viter on 04.06.2022.
//

import SwiftUI

struct BlendColorsView: View {
    @State private var amount = 1.0
    @State private var blend: BlendMode = .screen

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(blend)

                Circle()
                    .fill(.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(blend)

                Circle()
                    .fill(.blue)
                    .frame(width: 200 * amount)
                    .blendMode(blend)

            }
            .frame(width: 300, height: 300)

            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)

            Slider(value: $amount)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.black)
                .ignoresSafeArea()
    }
}

struct BlendColorsView_Previews: PreviewProvider {
    static var previews: some View {
        BlendColorsView()
    }
}
