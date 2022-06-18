//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Darya Viter on 18.06.2022.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String { firstName ?? "Unknown" }
    var wrappedLastName: String { lastName ?? "Unknown" }
}

extension Singer : Identifiable {

}
