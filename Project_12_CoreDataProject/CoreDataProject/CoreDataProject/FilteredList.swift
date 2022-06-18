//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//

import SwiftUI
import CoreData

enum FilterPredicateType: String {
    case beginsWith = "BEGINSWITH"
    case beginsWithC = "BEGINSWITH[c]"
    case contains = "CONTAINS"
    case containsC = "CONTAINS[c]"
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { content($0) }
    }

    init(
        filterKey: String,
        filterValue: String,
        filterPredicateType: FilterPredicateType,
        sortDescriptor: SortDescriptor<T>,
        @ViewBuilder content: @escaping (T) -> Content
    ) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [sortDescriptor],
            predicate: NSPredicate(format: "%K \(filterPredicateType.rawValue) %@", filterKey, filterValue)
        )
        self.content = content
    }
}
