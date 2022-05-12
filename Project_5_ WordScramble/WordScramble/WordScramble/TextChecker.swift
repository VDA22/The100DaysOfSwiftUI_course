//
//  TextChecker.swift
//  WordScramble
//
//  Created by Darya Viter on 07.05.2022.
//

import UIKit

struct TextChecker {
	func test(word: String) -> Bool {
		let checker = UITextChecker()

		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(
			in: word,
			range: range,
			startingAt: 0,
			wrap: false,
			language: "en"
		)

		let allGood = misspelledRange.location == NSNotFound
		return allGood
	}
}
