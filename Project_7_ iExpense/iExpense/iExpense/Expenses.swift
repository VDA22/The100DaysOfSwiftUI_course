//
//  Expenses.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
