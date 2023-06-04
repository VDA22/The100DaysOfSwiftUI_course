//
//  EnterNameView.swift
//  WeSplit
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct EnterNameView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
    }
}

struct EnterNameView_Previews: PreviewProvider {
    static var previews: some View {
        EnterNameView()
    }
}
