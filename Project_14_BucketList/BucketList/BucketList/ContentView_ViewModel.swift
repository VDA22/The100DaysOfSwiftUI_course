//
//  ContentView_ViewModel.swift
//  BucketList
//
//  Created by Darya Viter on 26.06.2022.
//

import MapKit
import Foundation
import LocalAuthentication

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations: [Location]

        @Published var selectedPlace: Location?
        @Published var isUnlock = false

        private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlace")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }

        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }

        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New location",
                                       description: "",
                                       latitude: mapRegion.center.latitude, longitude:
                                        mapRegion.center.longitude)
            locations.append(newLocation)

            save()
        }

        func updateLocation(location: Location) {
            guard let selectedPlace = selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }

            save()
        }

        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "We need to unlock your data."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authicationError in
                    if success {
                        Task { @MainActor in
                            self.isUnlock = true
                        }
                    } else {
                        // error
                    }
                }
            } else {
                // no biometric
            }
        }
    }
}
