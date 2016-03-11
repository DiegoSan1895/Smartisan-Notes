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
class Notes: Object {
    
    dynamic var created = NSDate()
    dynamic var stared = false
    dynamic var contents = ""
    dynamic var hasPhoto = false
    
    convenience required init(coder aDecoder: NSCoder){
        self.init()
        
        self.created = aDecoder.decodeObjectForKey("created") as! NSDate
        self.stared = aDecoder.decodeBoolForKey("stared")
        self.contents = aDecoder.decodeObjectForKey("contents") as! String
        self.hasPhoto = aDecoder.decodeBoolForKey("hasPhoto")
    }
    convenience init(stared: Bool = false, created: NSDate, contents: String, hasPhoto: Bool = false){
        self.init()
        
        self.created = created
        self.stared = stared
        self.contents = contents
        self.hasPhoto = hasPhoto
    }
    
}
