//
//  ContentView.swift
//  Drawing
//
//  Created by Darya Viter on 03.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                NavigationLink {
                    PathView()
                } label: {
                    Label("Path", systemImage: "arrow.rectanglepath")
                }

                NavigationLink {
                    ShapesView()
                } label: {
                    Label("Shapes", systemImage: "square.fill.on.circle.fill")
                }

                NavigationLink {
                    AnimateShapeView()
                } label: {
                    Label("Animate shapes", systemImage: "squareshape.squareshape.dashed")
                }

                NavigationLink {
                    AnimateMultyDataView()
                } label: {
                    Label("Animate multy data shapes", systemImage: "squareshape.dashed.squareshape")
                }

                NavigationLink {
                    BlendColorsView()
                } label: {
                    Label("Blend colors", systemImage: "circle.and.line.horizontal.fill")
                }

                NavigationLink {
                    ImagePicturedView()
                } label: {
                    Label("Image as border", systemImage: "square.dashed")
                }

                NavigationLink {
                    ColoringCirclesView()
                } label: {
                    Label("Coloring circles", systemImage: "circle.circle")
                }

                NavigationLink {
                    FlowerView()
                } label: {
                    Label("Flower", systemImage: "circle.hexagonpath")
                }

                NavigationLink {
                    SpirographView()
                } label: {
                    Label("Spirograph", systemImage: "wand.and.stars.inverse")
                }
            }
            .navigationTitle("Work With Path")

        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
