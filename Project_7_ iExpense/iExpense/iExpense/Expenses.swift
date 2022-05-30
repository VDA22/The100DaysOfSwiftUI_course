//
//  Expenses.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import Foundation

class Expenses: ObservableObject {
    private let itemsKey = "Items"
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: itemsKey)
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: itemsKey),
           let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
            items = decodedItems

            return
        }

        items = []
    }
}
