//
//  CategoryData+CoreDataProperties.swift
//  Blagaprint
//
//  Created by Иван Магда on 17.11.15.
//  Copyright © 2015 Blagaprint. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CategoryData {

    @NSManaged var image: NSData?
    @NSManaged var imageUrl: NSObject?
    @NSManaged var name: String?
    @NSManaged var recordChangeTag: String?
    @NSManaged var recordName: String?
    @NSManaged var type: String?
    @NSManaged var items: NSSet?

}