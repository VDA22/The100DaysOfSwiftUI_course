//
//  Prospect.swift
//  HotProspects
//
//  Created by Darya Viter on 28.06.2022.
//

import SwiftUI

class Prospect: Identifiable, Codable, Comparable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
    var addDate: Date = Date()

    static func < (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.name < rhs.name
    }

    static func == (lhs: Prospect, rhs: Prospect) -> Bool {
        lhs.id == rhs.id
    }
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect] = []

    private let savingKey = "SaveData"
    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlace")

    init() {
        if let data = UserDefaults.standard.data(forKey: savingKey),
           let decodedData = try? JSONDecoder().decode([Prospect].self, from: data) {
            people = decodedData
            return
        }

        if let data = try? Data(contentsOf: savePath),
           let decodedData = try? JSONDecoder().decode([Prospect].self, from: data) {
            people = decodedData
            return
        }
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
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError() }
        return path
    }
}
