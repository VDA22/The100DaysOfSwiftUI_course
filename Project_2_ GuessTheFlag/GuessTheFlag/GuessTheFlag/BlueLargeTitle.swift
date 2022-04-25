//
//  BlueLargeTitle.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct BlueLargeTitle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}

extension View {
	func blueLargeTitleStyle() -> some View {
		modifier(BlueLargeTitle())
	}
}
