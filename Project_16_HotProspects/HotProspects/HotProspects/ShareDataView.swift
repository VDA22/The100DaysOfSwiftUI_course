//
//  ShareDataView.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User

    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User

    var body: some View {
        Text(user.name)
    }
}

struct ShareDataView: View {
    @StateObject private var user = User()

        var body: some View {
            VStack {
                EditView() // .environmentObject(user) here
                DisplayView() //.environmentObject(user) here
            }
            .padding(.horizontal)
            .environmentObject(user) // or here
        }
}

struct ShareDataView_Previews: PreviewProvider {
    static var previews: some View {
        ShareDataView()
    }
}
