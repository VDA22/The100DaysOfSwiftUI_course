//
//  RoundCornersButton.swift
//  Animations
//
//  Created by Darya Viter on 13.05.2022.
//

import SwiftUI

struct RoundCornersButton: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me!") {
            enabled.toggle()
        }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red) // animate by default
            .animation(.default, value: enabled)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0)) // animate by interpolatingSpring
            .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)

    }
}

struct RoundCornersButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundCornersButton()
    }
}
