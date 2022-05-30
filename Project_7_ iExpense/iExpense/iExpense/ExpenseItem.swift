//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}
