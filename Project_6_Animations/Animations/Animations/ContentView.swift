//
//  ContentView.swift
//  Animations
//
//  Created by Darya Viter on 12.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            Form {
                NavigationLink {
                    ScaleButtonView()
                } label: {
                    Image(systemName: "eye.slash.circle")
                        .font(.title)
                    Text("Implicit animation")
                }
                
                NavigationLink {
                    TwistButtonView()
                } label: {
                    Image(systemName: "eye.circle")
                        .font(.title)
                    Text("Explicit animation")
                }
                
                NavigationLink {
                    ScaleStepperAndButtonView()
                } label: {
                    Image(systemName: "link.circle")
                        .font(.title)
                    Text("Animating bindings")
                }
                
                NavigationLink {
                    RoundCornersButton()
                } label: {
                    Image(systemName: "list.bullet.circle")
                        .font(.title)
                    Text("Controlling Animation")
                }
                
                NavigationLink {
                    DragCardView()
                } label: {
                    Image(systemName: "dot.circle.and.hand.point.up.left.fill")
                        .font(.title)
                    Text("Gesture animation")
                }
                
                NavigationLink {
                    TransitionRectangleView()
                } label: {
                    Image(systemName: "circle.dotted")
                        .font(.title)
                    Text("Transition animation")
                }
            }
            .navigationTitle("Animations")
            .navigationViewStyle(.stack)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
