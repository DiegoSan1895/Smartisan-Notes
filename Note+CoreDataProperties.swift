//
//  Note+CoreDataProperties.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 4/1/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var contents: String?
    @NSManaged var hasPhoto: NSNumber?
    @NSManaged var created: NSDate?
    @NSManaged var stared: NSNumber?
    @NSManaged var position: NSNumber?
    
    
}
