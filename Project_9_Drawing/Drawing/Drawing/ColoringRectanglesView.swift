//
//  ColoringRectanglesView.swift
//  Drawing
//
//  Created by Darya Viter on 04.06.2022.
//

import SwiftUI

struct GradientColorCyclingRectangle: View {
    var amount: Double = 0
    var steps = 100

    var startPoint: UnitPoint = .init(x: 0, y: 1)
    var endPount: UnitPoint = .init(x: 0, y: 1)

    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startPoint.x, endPount.x) }
        set {
            startPoint.x = newValue.first
            endPount.x = newValue.second
        }
    }

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: startPoint,
                            endPoint: endPount
                        ),
                        lineWidth: 5)
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

struct ColoringRectanglesView: View {
    @State private var colorCycle = 0.0
    
    @State private var startPointX = 0.0
    @State private var endPointX = 1.0

    var body: some View {
        VStack(spacing: 10) {
            GradientColorCyclingRectangle(amount: colorCycle, startPoint: .init(x: startPointX, y: 0), endPount: .init(x: endPointX, y: 1))
                .onTapGesture {
                    withAnimation {
                        startPointX += (0.5 - 1)
                        endPointX += 0.5 - 1
                    }
                }

            Slider(value: $colorCycle)
        }
        .padding()
    }
}

struct ColoringRectanglesView_Previews: PreviewProvider {
    static var previews: some View {
        ColoringRectanglesView()
    }
}
