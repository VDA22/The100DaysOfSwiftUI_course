//
//  DatePickerView.swift
//  BetterRest
//
//  Created by Darya Viter on 03.05.2022.
//

import SwiftUI

struct DatePickerView: View {
	@State private var wakeUp = Date.now

    var body: some View {
		DatePicker(
			"Please, enter a time",
			selection: $wakeUp,
			in: Date.now...
//			displayedComponents: .hourAndMinute
		)
//			.labelsHidden()
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
