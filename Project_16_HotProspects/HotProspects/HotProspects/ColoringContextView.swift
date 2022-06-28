//
//  ColoringContextView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

struct ColoringContextView: View {
    @State private var backgroundColor = Color.red

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .background(backgroundColor)

                Text("Change Color")
                    .padding()
                    .contextMenu {
                        Button(role: .destructive) {
                            backgroundColor = .red
                        } label: {
                            Label("Red", systemImage: "checkmark.circle.fill")
                        }

                        Button("Green") {
                            backgroundColor = .green
                        }

                        Button("Blue") {
                            backgroundColor = .blue
                        }
                    }
            }
        }
}

struct ColoringContextView_Previews: PreviewProvider {
    static var previews: some View {
        ColoringContextView()
    }
}
