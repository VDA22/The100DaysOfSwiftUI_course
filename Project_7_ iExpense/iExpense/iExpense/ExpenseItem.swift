//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Double

    enum ExpenseType: String, Codable {
        case personal = "Personal"
        case business = "Business"
    }
}
