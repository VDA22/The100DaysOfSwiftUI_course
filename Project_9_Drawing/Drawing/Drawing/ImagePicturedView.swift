//
//  ImagePicturedView.swift
//  Drawing
//
//  Created by Darya Viter on 04.06.2022.
//

import SwiftUI

struct ImagePicturedView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: 300, height: 300)
                .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)

            Capsule()
                .strokeBorder(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0, width: 0.5, height: 0.5), scale: 0.1), lineWidth: 20)
                .frame(width: 300, height: 200)
        }
        .padding()
    }
}

struct ImagePicturedView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicturedView()
    }
}
