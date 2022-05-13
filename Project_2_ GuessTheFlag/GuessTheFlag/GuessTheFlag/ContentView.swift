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
	@State private var score = 0
	@State private var totalCountOfAnswers = 0
    
    @State private var isNeedEffects = false
    
	@State private var countries = [
		"Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
		"Poland", "Russia", "Spain", "UK", "US"
	].shuffled()

	@State private var correctAnswer = Int.random(in: 0 ... 2)
	@State private var showingFinish = false

	private var finishTitle = "It's finish!"

	var body: some View {
		ZStack {
			RadialGradient(
				stops: [
					.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
					.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
				],
				center: .top,
				startRadius: 200,
				endRadius: 700
			)
				.ignoresSafeArea()

			Spacer()

			VStack {
				Text("Guess the flag")
					.font(.largeTitle.bold())
					.foregroundColor(.white)

				VStack(spacing: 15) {

					VStack {
						Text("Tap the flag of")
							.font(.subheadline.weight(.heavy))
							.foregroundStyle(.secondary)

						Text(countries[correctAnswer])
							.font(.largeTitle.weight(.semibold))
					}

					ForEach(0 ..< 3) { number in
						Button {
							flagTapped(number)
                            withAnimation {
                                isNeedEffects = true
                            }
						} label: {
							FlagImage(country: countries[number].lowercased())
        
                                .rotation3DEffect(
                                    .degrees(isNeedEffects && number == correctAnswer ? 360 : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity((isNeedEffects && number != correctAnswer ? 0.25 : 1))
                                .blur(radius: (isNeedEffects && number != correctAnswer) ? 2 : 0)
						}
					}
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 20)
				.background(.regularMaterial)
				.clipShape(RoundedRectangle(cornerRadius: 20))

				Spacer()
				Spacer()

				Text("Your score: \(score)")
					.foregroundColor(.white)
					.font(.title.bold())

				Spacer()
			}
			.padding()

		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: askQuestion)
		} message: {
			Text("Your score is \(score)")
		}
		.alert(finishTitle, isPresented: $showingFinish) {
			Button("Continue", action: restartTheGame)
		} message: {
			Text("Your score is \(score)")
		}
    }

	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
			score += 1
		} else {
			scoreTitle = "Wrong! That’s the flag of \(countries[number])"
			score -= 1
		}

		showingScore = true
		totalCountOfAnswers += 1
	}

	func askQuestion() {
        isNeedEffects = false
        
		if totalCountOfAnswers == 8 {
			showingFinish = true
		} else {
			countries.shuffle()
			correctAnswer = Int.random(in: 0 ... 2)
		}
	}

	func restartTheGame() {
		score = 0
		totalCountOfAnswers = 0
		showingFinish = false

		askQuestion()
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
