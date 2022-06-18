//
//  UniqueModelView.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//

import SwiftUI

struct UniqueModelView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }

            Button("Add") {
                let newWisard = Wizard(context: moc)
                newWisard.name = "Harry Potter"
            }

            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct UniqueModelView_Previews: PreviewProvider {
    static var previews: some View {
        UniqueModelView()
    }
}
