//
//  HoursStepperView.swift
//  BetterRest
//
//  Created by Darya Viter on 03.05.2022.
//

import SwiftUI

struct HoursStepperView: View {
	@State private var sleepAmount = 8.0

    var body: some View {
		VStack {
//			Text(Date.now, format: .dateTime)
			Text(Date.now.formatted(
				date: .long,
				time: .shortened
			))

			Stepper(
				"\(sleepAmount.formatted()) hours",
				value: $sleepAmount,
				in: 4 ... 12, step: 0.25
			)
		}
    }
}

struct HoursStepperView_Previews: PreviewProvider {
    static var previews: some View {
        HoursStepperView()
    }
}
