//
//  TwistButtonView.swift
//  Animations
//
//  Created by Darya Viter on 12.05.2022.
//

import SwiftUI

struct TwistButtonView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        VStack {
            Button("Tap Me!") {
                // explicit animation
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 180
                }
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct TwistButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TwistButtonView()
    }
}
