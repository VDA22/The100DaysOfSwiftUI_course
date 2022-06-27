//
//  EditView.swift
//  BucketList
//
//  Created by Darya Viter on 26.06.2022.
//

import SwiftUI

struct EditView: View {
    enum LoadingState {
        case loading, loaded, failed
    }

    @Environment(\.dismiss) var dismiss

    var location: Location
    var onSave: (Location) -> Void

    @ObservedObject private var viewModel: ViewModel

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Place descrption", text: $viewModel.description)
                }

                Section("Nearby...") {
                    switch viewModel.loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ")
                            + Text(page.description)
                                .italic()
                        }
                    case .failed:
                        Text("Please try again later")
                    }
                }
            }
            .navigationTitle("Place details")
            .navigationViewStyle(.stack)
            .toolbar {
                Button("Save") {
                    onSave(viewModel.save())
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }

    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave
        self.viewModel = .init(location: location)
    }

}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(location: .example) { _ in }
    }
}
