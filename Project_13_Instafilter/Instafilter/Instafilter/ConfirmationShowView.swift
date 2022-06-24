//
//  ConfirmationShowView.swift
//  Instafilter
//
//  Created by Darya Viter on 22.06.2022.
//

import SwiftUI

struct ConfirmationShowView: View {
    @State private var showingConfirmation = false
        @State private var backgroundColor = Color.white

        var body: some View {
            Text("Hello, World!")
                .frame(width: 300, height: 300)
                .background(backgroundColor)
                .onTapGesture {
                    showingConfirmation = true
                }
                .confirmationDialog("Change background", isPresented: $showingConfirmation) {
                    Button("Red") { backgroundColor = .red }
                    Button("Green") { backgroundColor = .green }
                    Button("Blue") { backgroundColor = .blue }
                    Button("Cancel", role: .cancel) { } // not necessary
                } message: {
                    Text("Select a new color")
                }
        }
}

struct ConfirmationShowView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationShowView()
    }
}
