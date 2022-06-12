//
//  Order.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import SwiftUI

struct OrderModel: Codable {
    var type = 0
    var quantity = 3
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }

    var hasValidAddress: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        && !zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    @Published var model = OrderModel()

    var encodedOrder: Data? {
        try? JSONEncoder().encode(model)
    }
}
