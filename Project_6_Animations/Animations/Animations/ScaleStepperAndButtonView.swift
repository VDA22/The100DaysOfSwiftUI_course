//
//  ScaleStepperAndButtonView.swift
//  Animations
//
//  Created by Darya Viter on 12.05.2022.
//

import SwiftUI

struct ScaleStepperAndButtonView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            Stepper(
                "Scale amount",
                // animating bindings
                value: $animationAmount.animation(
                    .easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
                ),
                in: 1 ... 10)
            
            Spacer()
            
            Button("Tap Me!") {
                animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            Spacer()
        }
        .padding()
    }
}

struct ScaleStepperAndButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleStepperAndButtonView()
    }
}
