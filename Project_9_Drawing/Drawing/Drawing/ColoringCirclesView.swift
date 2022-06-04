//
//  ColoringCirclesView.swift
//  Drawing
//
//  Created by Darya Viter on 04.06.2022.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount: Double = 0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
        }
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct GradientColorCyclingCircle: View {
    var amount: Double = 0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2)
            }
        }
        .drawingGroup() // Make it faster
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount

        if targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColoringCirclesView: View {
    @State private var colorCycle = 0.0
    var body: some View {
        VStack(spacing: 10) {
            GradientColorCyclingCircle(amount: colorCycle)

            Slider(value: $colorCycle)
        }
        .padding()
    }
}

struct ColoringCirclesView_Previews: PreviewProvider {
    static var previews: some View {
        ColoringCirclesView()
    }
}
