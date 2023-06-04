//
//  FormView.swift
//  WeSplit
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct FormView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Hello, world!")
                    Group {
                        Text("Hello, world!")
                            .padding()
                        Text("Hello, world!")
                            .padding()
                    }
                }

                Section {
                    ForEach(0..<5) { number in
                        Text("Row \(number)")
                    }
                }

                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
