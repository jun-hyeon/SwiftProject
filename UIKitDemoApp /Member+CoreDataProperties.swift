//
//  Member+CoreDataProperties.swift
//  UIKitDemoApp
//
//  Created by 최준현 on 11/23/23.
//
//

import Foundation
import CoreData


extension Member {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Member> {
        return NSFetchRequest<Member>(entityName: "Member")
    }

    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var age: String?

}

extension Member : Identifiable {

}
