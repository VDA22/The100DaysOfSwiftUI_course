//
//  WithGroupsView.swift
//  SnowSeeker
//
//  Created by Darya Viter on 06.07.2022.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

// Try on iPhone max
struct WithGroupsView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    @State private var layoutVertically = false

    var body: some View {
        VStack {
            Group {
                if layoutVertically {
                    VStack(content: UserView.init)
                } else {
                    HStack(content: UserView.init)
                }
            }
            .onTapGesture {
                withAnimation {
                    layoutVertically.toggle()
                }
            }

            Group {
                if sizeClass == .compact {
                    VStack(content: UserView.init)
                } else {
                    HStack(content: UserView.init)
                }
            }
        }
    }
}

struct WithGroupsView_Previews: PreviewProvider {
    static var previews: some View {
        WithGroupsView()
    }
}
