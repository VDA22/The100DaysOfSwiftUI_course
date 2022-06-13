//
//  MultyLineTextInputView.swift
//  Bookworm
//
//  Created by Darya Viter on 13.06.2022.
//

import SwiftUI

struct MultyLineTextInputView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .padding()
                .background(Color(white: 0.9))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .navigationTitle("Notes")
        }
    }
}

struct MultyLineTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        MultyLineTextInputView()
    }
}
