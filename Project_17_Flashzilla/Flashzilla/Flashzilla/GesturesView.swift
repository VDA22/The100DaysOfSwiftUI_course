//
//  GesturesView.swift
//  Flashzilla
//
//  Created by Darya Viter on 01.07.2022.
//

import SwiftUI

struct GesturesView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero

    @State private var offset = CGSize.zero
    @State private var isDragging = false

    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }

        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }

        let combined = pressGesture.sequenced(before: dragGesture)

        ScrollView {
            VStack {
                Text("Tap Me!")
                    .padding()
                    .onTapGesture {
                        print("Double tap")
                    }

                Text("Tap Me Twice!")
                    .padding()
                    .onTapGesture(count: 2) {
                        print("Double tap")
                    }

                Text("Tap Me and Hold")
                    .padding()
                    .onLongPressGesture(minimumDuration: 2) {
                        print("Long pressed")
                    }  onPressingChanged: { inProgress in
                        print("In progress: \(inProgress)!")
                    }

                Text("Scale Me!")
                    .padding()
                    .scaleEffect(finalAmount + currentAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { amount in
                                currentAmount = amount - 1
                            }
                            .onEnded { amont in
                                finalAmount += currentAmount
                                currentAmount = 0
                            }
                    )

                Text("Rotate Me!")
                    .padding()
                    .rotationEffect(currentAngle + finalAngle)
                    .gesture(
                        RotationGesture()
                            .onChanged { angle in
                                currentAngle = angle
                            }
                            .onEnded { angle in
                                finalAngle += currentAngle
                                currentAngle = .zero
                            }
                    )

                Circle()
                    .fill(.red)
                    .frame(width: 64, height: 64)
                    .scaleEffect(isDragging ? 1.5 : 1)
                    .offset(offset)
                    .gesture(combined)

            }
            .frame(maxWidth: .infinity)
            .padding()
            // if no child-action
            .onTapGesture {
                print("VStack tap")
            }
            // VStack-action first
            .highPriorityGesture(
                TapGesture()
                    .onEnded {
                        print("VStack High Priority tap")
                    }
            )
            // and VStack and child-action
            .simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        print("VStack tapped")
                    }
            )
        }

    }
}

struct GesturesView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesView()
    }
}
