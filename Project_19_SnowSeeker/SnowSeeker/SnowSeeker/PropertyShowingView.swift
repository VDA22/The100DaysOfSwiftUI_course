//
//  PropertyShowingView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 06.07.2022.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct PropertyShowingView: View {
    @State private var selectedSheetUser: User? = nil
    @State private var selectedAlertUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Show Sheet!")
                .onTapGesture {
                    selectedSheetUser = User()
                }
                .sheet(item: $selectedSheetUser) { user in
                    Text(user.id)
                }

            Text("Show Alert!")
                .onTapGesture {
                    selectedAlertUser = User()
                    isShowingUser = true
                }
                .alert("Welcome", isPresented: $isShowingUser, presenting: selectedAlertUser) { user in
                    Button(user.id) { }
                }

        }
    }
}

struct PropertyShowingView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyShowingView()
    }
}
