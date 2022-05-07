//
//  ContentView.swift
//  WordScramble
//
//  Created by Darya Viter on 07.05.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""

	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showError = false

    var body: some View {
		NavigationView {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.autocapitalization(.none)
				}

				Section {
					ForEach(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
					}
				}
			}
			.navigationTitle(rootWord)
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.alert(errorTitle, isPresented: $showError) {
				Button("OK", role: .cancel) { }
			} message: { Text(errorMessage) }

		}
		.navigationViewStyle(.stack)
    }

	func addNewWord() {
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		guard answer.count > 0 else { return }

		guard isOriginal(word: answer) else {
			wordError(title: "Word used already", message: "Be more original")
			return
		}

		guard isPossible(word: answer) else {
			wordError(title: "Word is not possible", message: "You can't spell that word from \(rootWord)")
			return
		}

		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "You can't just make them up, you know!  ")
			return
		}

		withAnimation {
			usedWords.insert(answer, at: 0)
		}
		newWord = ""
	}

	func startGame() {
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
		   let startWords = try? String(contentsOf: startWordsURL) {
			let allWords = startWords.components(separatedBy: "\n")
			rootWord = allWords.randomElement() ?? "silkworm"
		} else {
			fatalError("Would not find start.txt")
		}
	}

	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}

	func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}
		return true
	}

	func isReal(word: String) -> Bool {
		let checker = TextChecker()
		return checker.test(word: word)
	}

	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showError = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
