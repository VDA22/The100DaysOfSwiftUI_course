//
//  WithCustomPositionsView.swift
//  LayoutAndGeometry
//
//  Created by Darya Viter on 04.07.2022.
//

import SwiftUI

struct WithCustomPositionsView: View {
    var body: some View {
        VStack {
            Text("Hello, world 1!")
                .padding()
                .offset(x: 100, y: 100)
                .background(.red)

            Text("Hello, world 2!")
                .padding()
                .background(.red)
                .offset(x: 100, y: 100)

            Text("Hello, world 3!")
                .padding()
                .background(.red)
                .position(x: 100, y: 100)

            Text("Hello, world 4!")
                .position(x: 100, y: 100)
                .background(.red)
        }
    }
}

struct WithCustomPositionsView_Previews: PreviewProvider {
    static var previews: some View {
        WithCustomPositionsView()
    }
}
