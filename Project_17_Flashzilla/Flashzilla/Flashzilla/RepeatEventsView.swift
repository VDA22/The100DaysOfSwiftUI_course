//
//  RepeatEventsView.swift
//  Flashzilla
//
//  Created by Darya Viter on 01.07.2022.
//

import SwiftUI

struct RepeatEventsView: View {

    let timer = Timer.publish(every: 1, tolerance: 0, on: .main, in: .common).autoconnect()
    @State private var counter = 0

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                    print("Cancel")
                    dump(timer)
                } else {
                    print("The time is now \(time)")
                }
                counter += 1
            }
    }
}

struct RepeatEventsView_Previews: PreviewProvider {
    static var previews: some View {
        RepeatEventsView()
    }
}
