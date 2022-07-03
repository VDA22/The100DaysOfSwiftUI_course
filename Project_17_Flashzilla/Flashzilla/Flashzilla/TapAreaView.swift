//
//  TapAreaView.swift
//  Flashzilla
//
//  Created by Darya Viter on 01.07.2022.
//

import SwiftUI

struct TapAreaView: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }

                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
//                    .contentShape(Rectangle()) // cover RoundedRectangle
                    .onTapGesture {
                        print("Circle tapped!")
                    }
//                .allowsHitTesting(false) // disable tap
            }
            .padding()

            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }
//            .contentShape(Rectangle()) // enable tap on space between texts
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

struct TapAreaView_Previews: PreviewProvider {
    static var previews: some View {
        TapAreaView()
    }
}
