//
//  ContentView.swift
//  WeSplit
//
//  Created by Darya Viter on 09.03.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	@FocusState private var amountIsFocused: Bool

	private let tipPercentages = [15, 20, 25, 0]
	private var totalAmount: Double {
		let selectedTips = Double(tipPercentage)
		let totalTips = checkAmount / 100 * selectedTips

		return checkAmount + totalTips
	}
	private var amountPerPerson: Double {
		let peopleCount = Double(numberOfPeople + 2)

		return totalAmount / peopleCount
	}

    var body: some View {
		NavigationView {
			Form {
				Section {
					TextField(
						"Amount",
						value: $checkAmount,
						format: .currency(code: Locale.current.currencyCode ?? "USD")
					)
						.keyboardType(.decimalPad)
						.focused($amountIsFocused)

					Picker("Number of people", selection: $numberOfPeople) {
						ForEach(2 ..< 100) {
							Text("\($0) people")
						}
					}
				}

				Section {
					Picker("Percent", selection: $tipPercentage) {
						ForEach(0 ..< 101) {
							Text($0, format: .percent)
						}
					}
				} header: {
					Text("How much tip do you want to leave?")
				}

				Section {
					Text(amountPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				} header: {
					Text("Amount per person")
				}

				Section {
					Text(totalAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
				} header: {
					Text("Total amount")
				}
			}
			.navigationTitle("WeSplit")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()

					Button("Done") {
						amountIsFocused = false
					}
				}
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
