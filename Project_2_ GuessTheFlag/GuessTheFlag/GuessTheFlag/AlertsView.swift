//
//  AlertsView.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct AlertsView: View {
    @State private var showingAlert1 = false
    @State private var showingAlert2 = false

    var body: some View {
        VStack {
            Button("Show Alert") {
                showingAlert1 = true
            }
            .alert("Important message", isPresented: $showingAlert1) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            }

            Button("Show Alert 2") {
                showingAlert2 = true
            }
            .alert("Important message", isPresented: $showingAlert2) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
        }
    }
}

struct AlertsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsView()
    }
}
