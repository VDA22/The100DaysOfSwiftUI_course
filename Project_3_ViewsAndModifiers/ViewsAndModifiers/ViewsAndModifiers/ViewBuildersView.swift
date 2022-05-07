//
//  ViewBuildersView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct ViewBuildersView: View {
	let motto1 = Text("Draco dormiens")
	let motto2 = Text("nunquam titillandus")

	@ViewBuilder var spells: some View {
		Text("Lumos")
		Text("Obliviate")
	}

	var body: some View {
		VStack {
			motto1
				.foregroundColor(.red)
			motto2
				.foregroundColor(.blue)

			spells
		}
	}
}

struct ViewBuildersView_Previews: PreviewProvider {
	static var previews: some View {
		ViewBuildersView()
	}
}
