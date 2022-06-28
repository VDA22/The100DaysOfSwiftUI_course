//
//  IgnoreForAccessibilityView.swift
//  WithAccessibility
//
//  Created by Darya Viter on 27.06.2022.
//

import SwiftUI

struct IgnoreForAccessibilityView: View {
    var body: some View {
        VStack {
            Image(decorative: "character")
                .accessibilityHidden(true)

            VStack {
                Text("Your score is")
                Text("1000")
                    .font(.title)
            }
            .accessibilityElement() // will ignore
            .accessibilityLabel("Your score is 1000")
        }
    }
}

struct IgnoreForAccessibility_Previews: PreviewProvider {
    static var previews: some View {
        IgnoreForAccessibilityView()
    }
}
