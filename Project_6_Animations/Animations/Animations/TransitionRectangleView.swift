//
//  TransitionRectangleView.swift
//  Animations
//
//  Created by Darya Viter on 13.05.2022.
//

import SwiftUI

struct TransitionRectangleView: View {
    @State private var isShowingRect = false
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            firstFragment
            
            Spacer()
            
            secondFragment
            
            Spacer()
        }
    }

    var firstFragment: some View {
        VStack {
            Button("Tap Me!") {
                withAnimation {
                    isShowingRect.toggle()
                }
            }
            
            if isShowingRect {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
    
    var secondFragment: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(.blue)
                .frame(width: 200, height: 200)
            
            if isShowingRed {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)

            }
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}


struct TransitionRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionRectangleView()
    }
}
