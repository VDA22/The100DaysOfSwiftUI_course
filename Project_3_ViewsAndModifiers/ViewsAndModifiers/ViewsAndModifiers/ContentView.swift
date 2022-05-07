//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 24.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
			.frame(maxWidth: .infinity, maxHeight: .infinity)
			.background(.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
