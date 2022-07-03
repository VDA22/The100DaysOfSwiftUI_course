//
//  EditCards.swift
//  Flashzilla
//
//  Created by Darya Viter on 03.07.2022.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards: [Card] = []
    @State private var newPromt = ""
    @State private var newAnswer = ""

    var loadData: (() -> [Card])? = nil
    var saveData: (([Card]) -> Void)? = nil

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
            .onAppear {
                cards = loadData?() ?? []
            }
        }
    }

    private func addCard() {
        let trimmedPromt = newPromt.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !trimmedPromt.isEmpty && !trimmedAnswer.isEmpty else { return }

        let card = Card(prompt: trimmedPromt, answer: trimmedAnswer)
        cards.insert(card, at: 0)
        
        newPromt = ""
        newAnswer = ""

        saveData?(cards)
    }

    private func done() {
        dismiss()
    }

    private func removeCards(_ offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        saveData?(cards)
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
