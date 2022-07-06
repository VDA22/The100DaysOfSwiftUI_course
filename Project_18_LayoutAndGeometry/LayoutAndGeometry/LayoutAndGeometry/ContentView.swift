//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Darya Viter on 04.07.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 40 * getHeight(full: fullView.size.height, current: abs(geo.frame(in: .global).midY)))
                            .background(Color(hue: geo.frame(in: .global).midY / 720, saturation: geo.frame(in: .global).midY / fullView.size.height, brightness: 1))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(getOpacity(current: geo.frame(in: .global).minY))
                    }
                    .frame(height: 40)
                }
            }
        }
    }

    private func getOpacity(current: CGFloat) -> Double {
        if current <= 200 {
            return 24.0 / (200 - current)
        } else {
            return 1
        }
    }
    private func getHeight(full: CGFloat, current: CGFloat) -> Double {
        if current <= full {
            return Double((current + full) / (full * 2))
        }
        return 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
