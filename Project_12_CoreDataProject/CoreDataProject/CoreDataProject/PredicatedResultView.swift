//
//  PredicatedResultView.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//

import SwiftUI
import CoreData

struct PredicatedResultView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        sortDescriptors: [],
        predicate: nil
        // predicate: NSPredicate(format: "universe == 'Star Wars'")
        // predicate: NSPredicate(format: "universe == %@", "Star Wars")
        // predicate: NSPredicate(format: "name < %@", "F")
        // predicate: NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
        // predicate: NSPredicate(format: "name BEGINSWITH %@", "E") // case-sensitive
        // predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e") // not case-sensitive
        // predicate: NSPredicate(format: "name CONTAINS[c] %@", "e") // not case-sensitive

    ) var ships: FetchedResults<Ship>

    var body: some View {
        VStack {
            List(ships, id: \.self) {
                Text($0.name ?? "Unknown")
            }

            Button("Add Example") {
                let ship1 = Ship(context: moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"

                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"

                let ship3 = Ship(context: moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"

                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"

                try? moc.save()
            }
        }
    }
}

struct PredicatedResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredicatedResultView()
    }
}
