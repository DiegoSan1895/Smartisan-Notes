//
//  Notes.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import Foundation
import RealmSwift

class Notes: Object {
    
    dynamic var created = NSDate()
    dynamic var stared = false
    dynamic var contents = ""
    
    convenience required init(coder aDecoder: NSCoder){
        self.init()
        
        self.created = aDecoder.decodeObjectForKey("created") as! NSDate
        self.stared = aDecoder.decodeBoolForKey("stared")
        self.contents = aDecoder.decodeObjectForKey("contents") as! String
        
    }
    convenience init(stared: Bool, created: NSDate, contents: String){
        self.init()
        
        self.created = created
        self.stared = stared
        self.contents = contents
    }

}
