//
//  LandscapeCoolNavigationView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 06.07.2022.
//

import SwiftUI

// Try on iPhone (landscape) max or iPad
struct LandscapeCoolNavigationView: View {
    var body: some View {
        NavigationLink {
            Text("New secondary")
        } label: {
            Text("Hello, World!")
        }
        .navigationTitle("Primary")

        Text("Secondary")

        Text("Tertiary")
    }
}

struct LandscapeCoolNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        LandscapeCoolNavigationView()
    }
}
