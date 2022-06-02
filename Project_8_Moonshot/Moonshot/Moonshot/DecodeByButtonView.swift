//
//  DecodeByButtonView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Adress
}

struct Adress: Codable {
    let street: String
    let city: String
}

struct DecodeByButtonView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            if let user = try? JSONDecoder().decode(User.self, from: Data(input.utf8)) {
                print(user.address.street)
            }
        }
    }
}

struct DecodeByButtonView_Previews: PreviewProvider {
    static var previews: some View {
        DecodeByButtonView()
    }
}
