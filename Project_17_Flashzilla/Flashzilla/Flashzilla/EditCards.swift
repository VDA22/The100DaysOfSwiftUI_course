//
//  EditCards.swift
//  Flashzilla
//
//  Created by Darya Viter on 03.07.2022.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPromt = ""
    @State private var newAnswer = ""

    private let cardsKey = "Cards"

    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Promt", text: $newPromt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }

                Section {
                    ForEach(0 ..< cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }

    private func addCard() {
        let trimmedPromt = newPromt.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedPromt.isEmpty && !trimmedAnswer.isEmpty else { return }

        let card = Card(prompt: trimmedPromt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        saveData()
    }

    private func done() {
        dismiss()
    }

    private func loadData() {
        if let data = UserDefaults.standard.data(forKey: cardsKey),
           let decoded = try? JSONDecoder().decode([Card].self, from: data) {
            cards = decoded
        }
    }

    private func saveData() {
        if let data = try? JSONEncoder().encode(cards) {
            UserDefaults.standard.set(data, forKey: cardsKey)
        }
    }

    private func removeCards(_ offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData()
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
