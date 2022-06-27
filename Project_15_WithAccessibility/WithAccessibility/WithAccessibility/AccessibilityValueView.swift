//
//  AccessibilityValueView.swift
//  WithAccessibility
//
//  Created by Darya Viter on 27.06.2022.
//

import SwiftUI

struct AccessibilityValueView: View {
    @State private var value = 10

        var body: some View {
            VStack {
                Text("Value: \(value)")

                Button("Increment") {
                    value += 1
                }

                Button("Decrement") {
                    value -= 1
                }
            }
            .accessibilityElement()
            .accessibilityLabel("Value")
            .accessibilityValue(String(value))
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    value += 1
                case .decrement:
                    value -= 1
                default:
                    print("Not handled.")
                }
            }
        }
}

struct AccessibilityValueView_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilityValueView()
    }
}
