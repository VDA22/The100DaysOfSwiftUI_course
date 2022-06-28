//
//  Prospect.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]

    private let savingKey = "SaveData"

    init() {
        if let data = UserDefaults.standard.data(forKey: savingKey),
           let decodedData = try? JSONDecoder().decode([Prospect].self, from: data) {
            people = decodedData
            return
        }

        people = []
    }

    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }

    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }

    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: savingKey)
        }
    }
}
