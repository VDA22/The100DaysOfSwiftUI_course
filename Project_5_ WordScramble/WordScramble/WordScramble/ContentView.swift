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

	@State private var score = 0

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
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button("Restart") { startGame() }
				}
				ToolbarItem(placement: .bottomBar) {
					Text("Your Score is \(score)")
				}
			}

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

		guard isLongEnough(word: answer) else {
			wordError(title: "Word is too short!", message: "You can do better!")
			return
		}

		guard isNotEqualToRootWord(word: answer) else {
			wordError(title: "Stop cheating!", message: "You can't use root word!")
			return
		}

		withAnimation {
			usedWords.insert(answer, at: 0)
			score += answer.utf16.count
		}
		newWord = ""
	}

	func startGame() {
		withAnimation {
			score = 0
			usedWords = []
		}
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

	func isLongEnough(word: String) -> Bool {
		word.utf16.count >= 3
	}

	func isNotEqualToRootWord(word: String) -> Bool {
		word != rootWord
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
