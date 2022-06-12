//
//  CodableObservableObject.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import Foundation

class User: ObservableObject, Codable {

    enum CodingKeys: CodingKey {
        case name
    }
    @Published var name = "Darya Viter"

    required init(from decoder: Decoder) throws { // required not necessary, if class final
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
