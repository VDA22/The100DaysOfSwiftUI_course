//
//  NavigationLinkView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct NavigationLinkView: View {
    var body: some View {
        NavigationView {
            List(1 ..< 100) { row in
                NavigationLink {
                    Text("Detail View \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
        .navigationViewStyle(.stack)
    }
}

struct NavigationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkView()
    }
}
