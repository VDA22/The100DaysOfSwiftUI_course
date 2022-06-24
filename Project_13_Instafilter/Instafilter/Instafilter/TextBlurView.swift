//
//  TextBlurView.swift
//  Instafilter
//
//  Created by Darya Viter on 22.06.2022.
//

import SwiftUI

struct TextBlurView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            dump("New value is \(blurAmount)") // Will print when tap, but not when slide
        }
    }
    var body: some View {
        VStack {
            Text("Hello World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0 ... 20)

            Button("Random blur") {
                blurAmount = Double.random(in: 0 ... 20)
            }
        }
        .onChange(of: blurAmount) { newValue in
            print("New value is \(blurAmount)") // Will print when tap and when slide
        }
    }
}

struct TextBlurView_Previews: PreviewProvider {
    static var previews: some View {
        TextBlurView()
    }
}
