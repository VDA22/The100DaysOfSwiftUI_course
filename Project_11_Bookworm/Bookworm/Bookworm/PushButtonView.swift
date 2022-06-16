//
//  PushButtonView.swift
//  Bookworm
//
//  Created by Darya Viter on 13.06.2022.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @State var isOn: Bool
    @Binding var iosOnBinding: Bool

    private let onColors = [Color.red, .yellow]
    private let offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        VStack {
            Button(title) {
                isOn.toggle()
            }
            .padding()
            .background(
                LinearGradient(
                    colors: isOn ? onColors : offColors,
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: isOn ? 0 : 5)

            Button(title) {
                iosOnBinding.toggle()
            }
            .padding()
            .background(
                LinearGradient(
                    colors: iosOnBinding ? onColors : offColors,
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(radius: iosOnBinding ? 0 : 5)
        }
    }
}

struct PushButtonView: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: rememberMe, iosOnBinding: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct PushButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PushButtonView()
    }
}
