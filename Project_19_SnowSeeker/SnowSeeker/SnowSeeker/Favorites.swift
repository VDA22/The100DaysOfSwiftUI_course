//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Darya Viter on 10.07.2022.
//

import SwiftUI

class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<String>

    private let saveKey = "Favorites"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decodedData = try? JSONDecoder().decode(Set<String>.self, from: data) {
            resorts = decodedData
            return
        }
        resorts = []
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }

    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        } else {
            print("Fail to encode favorite resorts")
        }
    }
}
