//
//  CustomModifiersView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct CustomModifiersView: View {
    var body: some View {
		VStack(spacing: 24) {
			Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
				.titleStyle()
			Color.blue
				.frame(width: 300, height: 200)
				.withWatermark("Hacking with Swift")
		}
    }
}

struct TitleModifier: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.white)
			.padding()
			.background(.blue)
			.clipShape(RoundedRectangle(cornerRadius: 10))
	}
}

extension View {
	func titleStyle() -> some View {
		modifier(TitleModifier())
	}
}

struct Watermark: ViewModifier {
	let text: String

	func body(content: Content) -> some View {
		ZStack(alignment: .bottomTrailing) {
			content
			Text(text)
				.font(.caption)
				.foregroundColor(.white)
				.padding()
				.background(.black)
		}

	}
}

extension View {
	func withWatermark(_ text: String) -> some View {
		modifier(Watermark(text: text))
	}
}

struct CustomModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifiersView()
    }
}
