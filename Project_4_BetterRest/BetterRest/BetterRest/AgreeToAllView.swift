//
//  AgreeToAllView.swift
//  BetterRest
//
//  Created by Darya Viter on 25.04.2022.
//

import SwiftUI

struct AgreeToAllView: View {
	@State var agreedToTerms = false
	@State var agreedToPrivacyPolicy = false
	@State var agreedToEmails = false

	var body: some View {
		let agreedToAll = Binding(
			get: {
				agreedToTerms && agreedToPrivacyPolicy && agreedToEmails
			},
			set: {
				agreedToTerms = $0
				agreedToPrivacyPolicy = $0
				agreedToEmails = $0
			}
		)

		return VStack {
			Toggle("Agree to terms", isOn: $agreedToTerms)
			Toggle("Agree to privacy policy", isOn: $agreedToPrivacyPolicy)
			Toggle("Agree to receive shipping emails", isOn: $agreedToEmails)
			Toggle("Agree to all", isOn: agreedToAll)
		}
	}
}

struct AgreeToAllView_Previews: PreviewProvider {
    static var previews: some View {
        AgreeToAllView()
    }
}
