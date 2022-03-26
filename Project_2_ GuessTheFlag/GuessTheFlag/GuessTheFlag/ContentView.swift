//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 26.03.2022.
//

import SwiftUI

struct ContentView: View {
	@State private var showingScore = false
	@State private var scoreTitle = ""

	@State private var countries = [
		"Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
		"Poland", "Russia", "Spain", "UK", "US"
	].shuffled()

	@State private var correctAnswer = Int.random(in: 0 ... 2)

    var body: some View {
		ZStack {
			LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom 	)
				.ignoresSafeArea()
			VStack(spacing: 30) {
				VStack {
					Text("Tap the flag of")
						.font(.subheadline.weight(.heavy))
					Text(countries[correctAnswer])
						.font(.largeTitle.weight(.semibold))
				}
				.foregroundColor(.white)

				ForEach(0 ..< 3) { number in
					Button {
						flagTapped(number)
					} label: {
						Image(countries[number].lowercased())
							.renderingMode(.original)
							.clipShape(Capsule())
							.shadow(color: .white, radius: 5)
					}
				}
			}
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: askQuestion)
		} message: {
			Text("Your score is ???")
		}
    }

	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
		} else {
			scoreTitle = "Wrong"
		}

		showingScore = true
	}

	func askQuestion() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0 ... 2)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
