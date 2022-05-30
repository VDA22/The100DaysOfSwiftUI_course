//
//  AppStorageView.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("tapCount") private var appStorageTapCount = 0
    @AppStorage("Tap") private var appStorageTap = 0
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Button("Tap count (UD): \(tapCount)") {
                tapCount += 1
                UserDefaults.standard.set(tapCount, forKey: "Tap")
            }
            
            Button("Tap count (AS): \(appStorageTapCount)") {
                appStorageTapCount += 1
            }
            
            Text("UserDefaults Tap: \(tapCount)")
            Text("AppStorage tapCount: \(appStorageTapCount)")
            Text("AppStorage Tap: \(appStorageTap)")
            
            Spacer()
        }
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
