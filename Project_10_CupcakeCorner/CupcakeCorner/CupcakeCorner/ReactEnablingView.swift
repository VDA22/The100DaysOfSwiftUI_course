//
//  ReactEnablingView.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import SwiftUI

struct ReactEnablingView: View {
    @State private var userName = ""
    @State private var email = ""

    private var disablingForm: Bool {
        userName.isEmpty || userName.count < 5 || email.isEmpty || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("User Name", text: $userName)
                TextField("User Email", text: $email)
            }

            Section {
                Button("Create account") { print("Creating account") }
            }
            .disabled(disablingForm)
        }
    }
}

struct ReactEnablingView_Previews: PreviewProvider {
    static var previews: some View {
        ReactEnablingView()
    }
}
