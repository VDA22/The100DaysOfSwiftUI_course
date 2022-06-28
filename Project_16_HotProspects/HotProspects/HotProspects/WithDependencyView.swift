//
//  WithDependencyView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI
import SamplePackage

struct WithDependencyView: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }

    var body: some View {
        Text(results)
    }
}

struct WithDependencyView_Previews: PreviewProvider {
    static var previews: some View {
        WithDependencyView()
    }
}
