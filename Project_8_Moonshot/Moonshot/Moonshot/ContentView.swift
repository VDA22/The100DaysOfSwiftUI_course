//
//  ContentView.swift
//  Moonshot
//
//  Created by Darya Viter on 02.06.2022.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State private var gridItemWidth: CGFloat = 150

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: gridItemWidth))]) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            Group {
                                if gridItemWidth == .infinity {
                                    HStack {
                                        makeGroup(for: mission)
                                            .accessibilityElement()
                                            .accessibilityLabel("Mission \(mission.displayName) card")
                                    }
                                } else {
                                    VStack {
                                        makeGroup(for: mission)
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground))
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(id: "ChangeGridType", placement: .primaryAction) {
                    Button {
                        withAnimation {
                            gridItemWidth = gridItemWidth == .infinity ? 150 : .infinity
                        }
                    } label: {
                        Image(systemName: gridItemWidth == .infinity ? "square.grid.2x2" : "rectangle.grid.1x2")
                    }

                }
            }
        }
        .navigationViewStyle(.stack)
    }

    private func makeGroup(for mission: Mission) -> some View {
        Group {
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

            makeMissionTextsView(for: mission)
        }
    }

    private func makeMissionTextsView(for mission: Mission) -> some View {
        VStack {
            Text(mission.displayName)
                .font(.headline)
                .foregroundColor(.white)
            Text(mission.formattedLaunchDate)
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(.lightBackground)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
