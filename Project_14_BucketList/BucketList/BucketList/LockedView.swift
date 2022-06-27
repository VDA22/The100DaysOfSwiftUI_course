//
//  LockedView.swift
//  BucketList
//
//  Created by Darya Viter on 26.06.2022.
//

import LocalAuthentication
import SwiftUI

struct LockedView: View {
    @State private var isUnlock = false

    var body: some View {
        VStack {
            if isUnlock {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }

    private func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // reason for TouchID
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                if success {
                    isUnlock = true
                } else {
                    print(authenticationError?.localizedDescription ?? "")
                }
            }
        } else {
            print("No FaceID or TouchID")
        }
    }
}

struct LockedView_Previews: PreviewProvider {
    static var previews: some View {
        LockedView()
    }
}
