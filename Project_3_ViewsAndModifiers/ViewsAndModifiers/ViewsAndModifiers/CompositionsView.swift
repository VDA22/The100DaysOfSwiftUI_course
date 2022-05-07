//
//  CompositionsView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct CapsuleText: View {
	let text: String

	var body: some View {
		Text(text)
			.font(.largeTitle)
			.padding()
//			.foregroundColor(.white)
			.background(.blue)
			.clipShape(Capsule())
	}
}

struct CompositionsView: View {
    var body: some View {
		VStack {
			CapsuleText(text: "First")
				.foregroundColor(.white)
			CapsuleText(text: "Second")
				.foregroundColor(.yellow)
		}
    }
}

struct CompositionsView_Previews: PreviewProvider {
    static var previews: some View {
        CompositionsView()
    }
}
