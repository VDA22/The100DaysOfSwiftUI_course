//
//  WithScrollView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Create a CustomText with text: \(text)")
        self.text = text
    }
}

struct WithScrollView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct WithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        WithScrollView()
    }
}
