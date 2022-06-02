//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct GridLayoutView: View {
    let fixedLayout = [
        GridItem(.fixed(80)),
        GridItem(.fixed(80)),
        GridItem(.fixed(80))
    ]

    let adaptiveLAyout = [ GridItem(.adaptive(minimum: 80)) ]

    var body: some View {
        VStack {
            LazyVGrid(columns: fixedLayout) {
                ForEach(1..<10) {
                    Text("Item \($0)")
                }
            }

            LazyVGrid(columns: adaptiveLAyout) {
                ForEach(1..<10) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct GridLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        GridLayoutView()
    }
}
