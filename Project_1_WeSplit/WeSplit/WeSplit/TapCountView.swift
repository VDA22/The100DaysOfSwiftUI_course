//
//  TapCountView.swift
//  WeSplit
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct TapCountView: View {
    @State var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}

struct TapCountView_Previews: PreviewProvider {
    static var previews: some View {
        TapCountView()
    }
}
