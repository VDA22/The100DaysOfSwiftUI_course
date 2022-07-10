//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 10.07.2022.
//

import SwiftUI

struct SkiDetailsView: View {
    let resort: Resort

    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resort.elevation)m")
            }

            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resort.snowDepth)cm")
                    .font(.title2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: .example)
    }
}
