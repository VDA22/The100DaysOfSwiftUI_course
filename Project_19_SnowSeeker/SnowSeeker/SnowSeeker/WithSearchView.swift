//
//  WithSearchView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 10.07.2022.
//

import SwiftUI

struct WithSearchView: View {
    @State private var searchText = ""
    
    let allNames = ["Subh", "Vina", "Melvin", "Stefanie"]

    var filteredNames: [String] {
        if searchText.isEmpty {
            return allNames
        } else {
            return allNames.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

struct WithSearchView_Previews: PreviewProvider {
    static var previews: some View {
        WithSearchView()
    }
}
