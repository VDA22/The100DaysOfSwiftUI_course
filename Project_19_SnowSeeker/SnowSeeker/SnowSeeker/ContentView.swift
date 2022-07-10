//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 06.07.2022.
//

import SwiftUI

struct ContentView: View {
    enum SortType {
        case `default`
        case byName
        case byCountry
    }

    @State private var searchText = ""
    @StateObject var favorites = Favorites()
    @State private var sortType = SortType.default
    @State private var showSortMenu = false

    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var sortedResorts: [Resort] {
        switch sortType {
        case .default:
            return filteredResorts
        case .byName:
            return filteredResorts.sorted { $0.name < $1.name }
        case .byCountry:
            return filteredResorts.sorted { $0.country < $1.country }
        }
    }

    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.secondary, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }

                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
                .confirmationDialog("Sort type", isPresented: $showSortMenu) {

                    Button("Sort By Default") { sortType = .default }
                    Button("Sort By Name") { sortType = .byName }
                    Button("Sort By Country") { sortType = .byCountry }
                }
                .toolbar {
                    Button {
                        showSortMenu = true
                    } label: {
                        Label("Sort Resorts", systemImage: "arrow.up.arrow.down.circle.fill")
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")

            WelcomeView()
        }
        .environmentObject(favorites)
//        .phoneOnlyStackNavigationView()
    }
}

// if not need split view on phones use it as NavigationView modifier
extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
