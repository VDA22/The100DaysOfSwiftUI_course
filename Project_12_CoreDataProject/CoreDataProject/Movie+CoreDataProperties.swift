//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var unwrappedTitle: String {
        title ?? "Unknown Title"
    }
}

extension Movie : Identifiable {

}
