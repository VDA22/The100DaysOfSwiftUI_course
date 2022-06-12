//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.model.name)
                TextField("Street", text: $order.model.streetAddress)
                TextField("City", text: $order.model.city)
                TextField("Zip", text: $order.model.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(!order.model.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(order: Order())
        }
    }
}
