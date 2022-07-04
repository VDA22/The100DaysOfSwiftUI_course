//
//  ScrollAndGeometryView.swift
//  LayoutAndGeometry
//
//  Created by Darya Viter on 04.07.2022.
//

import SwiftUI

struct ScrollAndGeometryView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        VStack {
            GeometryReader { fullView in
                ScrollView {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Text("Row #\(index)")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(colors[index % 7])
                                .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(height: 40)
                    }
                }
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) {
                    ForEach(1..<20) { num in
                        GeometryReader { geo in
                            Text("Number \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .rotation3DEffect(.degrees(-geo.frame(in: .global).minX) / 8, axis: (x: 0, y: 1, z: 0))
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 200, height: 200)
                    }
                }
            }
            
        }
    }
}

struct ScrollAndGeometryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollAndGeometryView()
    }
}
