//
//  WithCustomAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Darya Viter on 04.07.2022.
//

import SwiftUI

struct WithCustomAlignmentView: View {
    var body: some View {
        VStack {
            Text("Live long and prosper")
                .frame(width: 150, height: 150)
                .offset(x: 10, y: 10)

            HStack(alignment: .bottom) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }

            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }

            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                Text("This is a longer line of text")
            }
            .background(.red)
            .frame(width: 400, height: 200)
            .background(.blue)

            VStack(alignment: .leading) {
                    ForEach(0..<10) { position in
                        Text("Number \(position)")
                            .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                    }
                }
                .background(.red)
                .frame(width: 250, height: 250)
                .background(.blue)
        }
    }
}

struct WithCustomAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        WithCustomAlignmentView()
    }
}
