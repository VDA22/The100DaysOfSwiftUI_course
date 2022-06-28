//
//  ManuallyPublishingView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    @Published var firstValue = 0
    var secondValue = 0 {
        willSet {
            objectWillChange.send()
        }
    }

        init() {
            for i in 1...10 {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                    self.firstValue += 1
                    self.secondValue += 1
                }
            }
        }
}

struct ManuallyPublishingView: View {
    @StateObject private var updater = DelayedUpdater()

    var body: some View {
        Text("Value is \(updater.firstValue)")
    }
}

struct ManuallyPublishingView_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingView()
    }
}
