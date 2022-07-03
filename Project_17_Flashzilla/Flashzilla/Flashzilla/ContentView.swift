//
//  ContentView.swift
//  Flashzilla
//
//  Created by Darya Viter on 01.07.2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    @State private var cards = [Card]()

    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true

    @State private var showingEditScreen = false

    private var loadedCards: [Card] { loadFromFile() }

    private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedPlace")

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()

            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())

                ZStack {
                    ForEach(cards) { card in
                        if let index = cards.firstIndex(of: card) {
                            CardView(card: card) { isCorrect in
                                guard let index = cards.firstIndex(of: card) else { return }
                                withAnimation {
                                    if isCorrect {
                                        removeCard(at: index)
                                    } else {
                                        reorderCards(at: index)
                                    }
                                }
                            }
                            .stack(at: index, in: cards.count)
                            .allowsHitTesting(index == cards.count - 1)
                            .accessibilityHidden(index < cards.count - 1)
                        }
                    }
                }
                .allowsHitTesting(timeRemaining > 0)

                if cards.isEmpty {
                    Button(cards.isEmpty && loadedCards.isEmpty ? "Add Cards" : "Start Again",
                           action: cards.isEmpty && loadedCards.isEmpty ? { showingEditScreen = true } : resetCards)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
            }

            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }

                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()

            if differentiateWithoutColor || voiceOverEnabled {
                VStack {
                    Spacer()

                    HStack {
                        Button {
                            withAnimation {
                                reorderCards(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct")
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }

            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                isActive = !cards.isEmpty
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            EditCards(loadData: loadFromFile, saveData: saveToFile)
        }
        .onAppear(perform: resetCards)
    }

    private func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }

    private func reorderCards(at index: Int) {
        guard index >= 0 else { return }
        let tempCard = cards[index]
        let newTempCard = Card(prompt: tempCard.prompt, answer: tempCard.answer)
        cards.remove(at: index)
        cards.insert(newTempCard, at: 0)
    }

    private func resetCards() {
        cards = loadedCards
        timeRemaining = 100
        isActive = !cards.isEmpty
    }

    private func loadFromFile() -> [Card] {
        do {
            let data = try Data(contentsOf: savePath)
            let decodedCards = try JSONDecoder().decode([Card].self, from: data)
            return decodedCards
        } catch {
            print(error.localizedDescription)
            return []
        }
    }

    private func saveToFile(_ cards: [Card] = []) {
        do {
            let data = try JSONEncoder().encode(cards)
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

extension View {
    func stack(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(x: 0, y: offset * 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
