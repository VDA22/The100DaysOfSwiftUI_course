//
//  StatesView.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import SwiftUI

struct UserStruct {
    var firstName = "Bilbo"
    var lastName = "Beggins"
}

class UserClass {
    var firstName = "Bilbo"
    var lastName = "Beggins"
}

class UserClassObservable: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Beggins"
}

struct StatesView: View {
    @State private var userStruct = UserStruct()
    @State private var userClass = UserClass()
    @StateObject private var userClassObservable = UserClassObservable()
    
    var body: some View {
        VStack {
            
            // work
            VStack {
                Text("Your name is \(userStruct.firstName) \(userStruct.lastName).")
                
                TextField("First name", text: $userStruct.firstName)
                TextField("Last name", text: $userStruct.lastName)
            }
            
            // not work
            VStack {
                Text("Your name is \(userClass.firstName) \(userClass.lastName).")
                
                TextField("First name", text: $userClass.firstName)
                TextField("Last name", text: $userClass.lastName)
            }
            
            // work
            VStack {
                Text("Your name is \(userClassObservable.firstName) \(userClassObservable.lastName).")
                
                TextField("First name", text: $userClassObservable.firstName)
                TextField("Last name", text: $userClassObservable.lastName)
            }
        }
        .padding()
    }
}

struct StatesView_Previews: PreviewProvider {
    static var previews: some View {
        StatesView()
    }
}
