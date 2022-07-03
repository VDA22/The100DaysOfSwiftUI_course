//
//  Card.swift
//  Flashzilla
//
//  Created by Darya Viter on 02.07.2022.
//

import Foundation

struct Card: Codable, Identifiable, Equatable {
    var id: UUID = UUID()
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
