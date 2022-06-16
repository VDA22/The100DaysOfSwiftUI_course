//
//  CoreDataWorkView.swift
//  Bookworm
//
//  Created by Darya Viter on 13.06.2022.
//

import SwiftUI

struct CoreDataWorkView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>

    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }

            Button("Add") {
                let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!

                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"

                try? moc.save()
            }
        }
    }
}

struct CoreDataWorkView_Previews: PreviewProvider {
    @StateObject private static var dataController = DataController()

    static var previews: some View {
        CoreDataWorkView()    
    }
}
