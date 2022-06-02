//
//  MissionDescriptionView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct MissionDescriptionView: View {
    let missionDescription: String

    var body: some View {
        VStack(alignment: .leading) {
            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)

            Text("Mission Highlights")
                .font(.title.bold())
                .padding(.bottom, 5)

            Text(missionDescription)

            Rectangle()
                .frame(height: 2)
                .foregroundColor(.lightBackground)
                .padding(.vertical)

            Text("Crew")
                .font(.title.bold())
                .padding(.bottom, 5)
        }
        .padding(.horizontal)
    }
}

struct MissionDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MissionDescriptionView(missionDescription: "")
    }
}
