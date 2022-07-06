//
//  WithCrossViewAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by Darya Viter on 04.07.2022.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct WithCrossViewAlignmentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) {
                        $0[VerticalAlignment.center]
                    }
                Image("paul-hudson")
                    .resizable()
                    .frame(width: 64, height: 64)
            }

            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .font(.largeTitle)
                    .alignmentGuide(.midAccountAndName) {
                        $0[VerticalAlignment.center]
                    }
            }
        }
    }
}

struct WithCrossViewAlignmentView_Previews: PreviewProvider {
    static var previews: some View {
        WithCrossViewAlignmentView()
    }
}
