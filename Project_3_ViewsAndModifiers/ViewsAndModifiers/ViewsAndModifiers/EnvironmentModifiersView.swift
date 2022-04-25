//
//  EnvironmentModifiersView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct EnvironmentModifiersView: View {
    var body: some View {
		VStack(spacing: 24) {
			VStack {
				Text("Gryffindor")
					.font(.largeTitle)
				Text("Hufflepuff")
				Text("Ravenclaw")
				Text("Slytherin")
			}
			.font(.title)

			VStack {
				Text("Gryffindor")
					.blur(radius: 0)
				Text("Hufflepuff")
				Text("Ravenclaw")
				Text("Slytherin")
			}
			.blur(radius: 5)
		}
    }
}

struct EnvironmentModifiersView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiersView()
    }
}
