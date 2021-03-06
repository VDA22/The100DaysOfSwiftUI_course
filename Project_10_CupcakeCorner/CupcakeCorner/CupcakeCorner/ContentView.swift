//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 09.06.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.model.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(order.model.quantity)", value: $order.model.quantity, in: 3 ... 20)
                }

                Section {
                    Toggle("Any special requests?", isOn: $order.model.specialRequestEnabled.animation())
                    if order.model.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.model.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.model.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
