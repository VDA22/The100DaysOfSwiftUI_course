//
//  StacksView.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct StacksView: View {
    var body: some View {
        VStack {
            VStack {
                Text("First")
                Spacer()
                Text("Second")
                Spacer()
                Text("Third")
            }

            HStack(spacing: 20) {
                Text("Hello, world!")
                Text("This is inside a stack")
            }

            ZStack {
                Color.red
//                    .frame(width: 200, height: 200)
//                    .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
                Text("Hello, world!")
                    .foregroundColor(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
//            .ignoresSafeArea()
//            .background(.red)
        }
    }
}

struct StacksView_Previews: PreviewProvider {
    static var previews: some View {
        StacksView()
    }
}
