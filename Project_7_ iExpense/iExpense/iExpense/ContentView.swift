//
//  ContentView.swift
//  iExpense
//
//  Created by Darya Viter on 30.05.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                Section("Personal") {
                    ForEach(expenses.items) { item in
                        Group {
                            if item.type == .personal {
                                makeExpenseRowView(for: item)
                            }
                        }
                        .accessibilityElement()
                        .accessibilityLabel("Item is \(item.name) and value is \(item.amount)")
                        .accessibilityHint(item.type)
                    }
                    .onDelete(perform: removeItems(at:))
                }

                Section("Business") {
                    ForEach(expenses.items) { item in
                        Group {
                            if item.type != .personal {
                                makeExpenseRowView(for: item)
                            }
                        }
                    }
                    .onDelete(perform: removeItems(at:))
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                ToolbarItem(id: "Add expense", placement: .primaryAction) {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
        .navigationViewStyle(.stack)
    }
    
    private func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }

    private func getColorFor(amount: Double) -> Color {
        switch amount {
        case ..<10:
            return .green
        case 10 ... 100:
            return .orange
        default:
            return .red
        }
    }

    @ViewBuilder
    private func makeExpenseRowView(for item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type.rawValue)
                    .font(.caption)
            }

            Spacer()

            Text(
                item.amount,
                format: .currency(
                    code: Locale.current.currencyCode ?? "USD"
                )
            )
                .foregroundColor(getColorFor(amount: item.amount))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
