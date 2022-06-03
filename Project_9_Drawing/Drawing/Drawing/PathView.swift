//
//  PathView.swift
//  Drawing
//
//  Created by Darya Viter on 03.06.2022.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
//        .fill(.red)
//        .stroke(.blue, lineWidth: 10)
        .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct PathView_Previews: PreviewProvider {
    static var previews: some View {
        PathView()
    }
}
