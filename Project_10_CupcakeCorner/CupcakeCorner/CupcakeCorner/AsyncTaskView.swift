//
//  AsyncTaskView.swift
//  CupcakeCorner
//
//  Created by Darya Viter on 12.06.2022.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct AsyncTaskView: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            dump(response)

            if let decodedResult = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResult.results
            }

        } catch {
            print("Invalid data, error: \(error.localizedDescription)")
        }
    }
}

struct AsyncTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncTaskView()
    }
}
