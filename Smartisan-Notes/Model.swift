//
//  Notes.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import Foundation
import RealmSwift

/// if you change the Model Object, you must perform migration
// 总是在这个队列里使用 Realm
let realmQueue = dispatch_queue_create("com.Smartisan.Queue", dispatch_queue_attr_make_with_qos_class(DISPATCH_QUEUE_SERIAL, QOS_CLASS_UTILITY, 0))

class Notes: Object {
    
    dynamic var id = Int(NSDate().timeIntervalSince1970)
    dynamic var created = NSDate()
    dynamic var stared = false
    dynamic var contents = ""
    dynamic var hasPhoto = false
    
    // indexed properties
    override static func indexedProperties() -> [String]{
        return ["created"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Image: Object {
    
    
}