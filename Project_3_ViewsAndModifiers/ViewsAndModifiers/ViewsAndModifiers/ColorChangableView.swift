//
//  ColorChangableView.swift
//  ViewsAndModifiers
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct ColorChangableView: View {
	@State var useRedText = false
    var body: some View {
		Button("Tap Me!") {
			useRedText.toggle()
		}
		.foregroundColor(useRedText ? .red : .blue)
    }
}

struct ColorChangableView_Previews: PreviewProvider {
    static var previews: some View {
        ColorChangableView()
    }
}
