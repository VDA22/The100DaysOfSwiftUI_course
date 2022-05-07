//
//  ListsView.swift
//  WordScramble
//
//  Created by Darya Viter on 07.05.2022.
//

import SwiftUI

struct ListsView: View {
    var body: some View {
		ZStack {
			Color.cyan
			VStack {
				List(0 ..< 2) {
					Text("Text \($0)")
				}
				.listStyle(.inset)

				List(0 ..< 2) {
					Text("Text \($0)")
				}
				.listStyle(.insetGrouped)

				List(0 ..< 2) {
					Text("Text \($0)")
				}
				.listStyle(.grouped)

				List(0 ..< 2) {
					Text("Text \($0)")
				}
				.listStyle(.plain)

				List {
					Section("Static Section") {
						Text("First")
						Text("Second")
					}

					Section("Dynamic") {
						ForEach(0 ..< 4) {
							Text("Dynamic \($0)")
						}
					}
				}
				.listStyle(.sidebar)
			}
		}
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
