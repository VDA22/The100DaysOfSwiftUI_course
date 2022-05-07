//
//  ModifierOrderView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct ModifierOrderView: View {
    var body: some View {
		VStack {
			Button("Tap me!") {
				print(type(of: self.body))
			}
			.background(.red)
			.frame(width: 200, height: 200)
			//		.background(.red)

			Text("Hello, world!")
				.padding()
				.background(.red)
				.padding()
				.background(.blue)
				.padding()
				.background(.green)
				.padding()
				.background(.yellow)
		}
    }
}

struct ModifierOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ModifierOrderView()
    }
}
