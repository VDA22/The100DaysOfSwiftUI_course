//
//  DragCardView.swift
//  Animations
//
//  Created by Darya Viter on 13.05.2022.
//

import SwiftUI

struct DragCardView: View {
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    let letters = Array("Hello, SwiftUI")
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(0 ..< letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount
                    )
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
    
    var linearGradientView: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        // explicit animation
                        withAnimation {
                            dragAmount = .zero
                        }
                    }
            )
            // implicit animation
//            .animation(.spring(), value: dragAmount)
    }
}

struct DragCardView_Previews: PreviewProvider {
    static var previews: some View {
        DragCardView()
    }
}
