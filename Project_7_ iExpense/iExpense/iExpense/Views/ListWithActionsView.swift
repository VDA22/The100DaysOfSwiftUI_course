//
//  ListWithActionsView.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import SwiftUI

struct ListWithActionsView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                // Will not work with onDelete
                //        List(numbers, id: \.self) {
                //            Text("Row \($0)")
                //        }
                
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                Button("Add") {
                    withAnimation {
                        numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
            }
            .padding()
            .navigationTitle("OnDelete()")
            .toolbar {
                EditButton()
            }
        }
    }
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ListWithActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ListWithActionsView()
    }
}
