//
//  GradientView.swift
//  GuessTheFlag
//
//  Created by Darya Viter on 21.10.2022.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

            LinearGradient(gradient: Gradient(stops: [
                Gradient.Stop(color: .white, location: 0.45),
                Gradient.Stop(color: .black, location: 0.55),
            ]), startPoint: .top, endPoint: .bottom)

            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)

            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)

        }

    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
