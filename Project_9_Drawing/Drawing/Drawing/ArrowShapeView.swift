//
//  ArrowShapeView.swift
//  Drawing
//
//  Created by Darya Viter on 04.06.2022.
//

import SwiftUI

struct Arrow: Shape {
    var arrowTailWidth: Double = 1.0
    var arrowTailLenght: Double = 1.0
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.minX, y: rect.midY - arrowTailWidth / 2))
        path.addLine(to: CGPoint(x: arrowTailLenght, y: rect.midY - arrowTailWidth / 2))
        path.addLine(to: CGPoint(x: arrowTailLenght, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + arrowTailLenght, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX + arrowTailLenght, y: rect.midY + arrowTailWidth / 2))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY + arrowTailWidth / 2))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY - arrowTailWidth / 2))

        return path
    }
}

struct ArrowShapeView: View {
    @State private var arrowTailWidth = 40.0
    @State private var arrowTailLenght = 40.0

    var body: some View {
        VStack(spacing: 10) {
            Arrow(arrowTailWidth: arrowTailWidth, arrowTailLenght: arrowTailLenght)
                .stroke(.red)
                .frame(width: 200, height: 200)

            Text("Arrow Tail Width")
            Slider(value: $arrowTailWidth, in: 10 ... 90)

            Text("Arrow Tail Length")
            Slider(value: $arrowTailLenght, in: 10 ... 90)
        }
        .padding(.horizontal)
    }
}

struct ArrowShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowShapeView()
    }
}
