//
//  AppStatesCatchView.swift
//  Flashzilla
//
//  Created by Darya Viter on 02.07.2022.
//

import SwiftUI

struct AppStatesCatchView: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct AppStatesCatchView_Previews: PreviewProvider {
    static var previews: some View {
        AppStatesCatchView()
    }
}
