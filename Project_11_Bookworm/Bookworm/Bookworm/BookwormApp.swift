//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Darya Viter on 13.06.2022.
//

import SwiftUI

@main
struct BookwormApp: App {
//    @StateObject private var dataController = DataController() // for CoreDataWorkView

    var body: some Scene {
        WindowGroup {
            ContentView()
            
//            CoreDataWorkView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
