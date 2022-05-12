//
//  ScaleButtonView.swift
//  Animations
//
//  Created by Darya Viter on 12.05.2022.
//

import SwiftUI

struct ScaleButtonView: View {
    @State private var animationAmountFirst = 1.0
    @State private var animationAmountSecond = 1.0
    
    var body: some View {
        VStack(spacing: 40) {
            firstButton
            secondButton
        }
    }
    
    var firstButton: some View {
        Button("Tap Me\nFirst!") {
            animationAmountFirst += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmountFirst)
        .blur(radius: (animationAmountFirst - 1) * 3)
        // implicit animation
        .animation(
            .easeInOut(duration: 1)
//                .delay(0.5)
                .repeatCount(3, autoreverses: false),
            value: animationAmountFirst
        )
    }
    
    var secondButton: some View {
        Button("Tap Me\nSecond!") { }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmountSecond)
                .opacity(2 - animationAmountSecond)
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: animationAmountSecond
                )
        )
        .onAppear { animationAmountSecond = 2 }
    }
}

struct ScaleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleButtonView()
    }
}
