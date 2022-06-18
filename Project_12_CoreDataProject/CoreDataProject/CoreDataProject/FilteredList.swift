//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { content($0) }
    }

    init(
        filterKey: String,
        filterValue: String,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
        )
        self.content = content
    }
}
