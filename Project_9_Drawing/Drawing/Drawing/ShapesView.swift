//
//  ShapesView.swift
//  Drawing
//
//  Created by Darya Viter on 03.06.2022.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insetAmount = 0.0


    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.midY),
            radius: rect.width / 2 - insetAmount,
            startAngle: modifiedStart,
            endAngle: modifiedEnd,
            clockwise: !clockwise
        )

        return path
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct ShapesView: View {
    var body: some View {
        VStack(spacing: 10) {
            Triangle()
            //            .fill(.red)
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                .frame(width: 200, height: 200)

            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 200, height: 200)

            Circle()
                .strokeBorder(.blue, lineWidth: 40)
                .frame(width: 200, height: 200)

            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .strokeBorder(.blue, lineWidth: 40)
                .frame(width: 200, height: 200)
        }
    }
}

struct ShapesView_Previews: PreviewProvider {
    static var previews: some View {
        ShapesView()
    }
}
