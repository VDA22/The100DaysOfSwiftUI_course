//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct FlagImage: View {
	let country: String
	
	var body: some View {
		Image(country)
			.renderingMode(.original)
			.clipShape(Capsule())
			.shadow(color: .white, radius: 5)
	}
}
