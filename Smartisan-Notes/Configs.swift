
//
//  Configs.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import Foundation


struct AppURL {
    static let clockURL = NSURL(string: "notes://")!
    static let syncURL = NSURL(string: "huan-xi-yun-tong-bu-gong-ju://")!
    static let calenderURL = NSURL(string: "smartisan-calendar://")!
    
    static let smartisanWeb = NSURL(string: "https://store.smartisan.com")!
}
struct AppItunsURL {
    static let calenderURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-calendar/id944154964?mt=8")!
    static let syncURL = NSURL(string: "https://itunes.apple.com/cn/app/huan-xi-yun-tong-bu-gong-ju/id880078620?mt=8")!
    static let clockURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-clock/id828812911?mt=8")!
    static let notesURL = NSURL(string: "https://itunes.apple.com/cn/app/chui-zi-bian-qian/id867934588?mt=8")!
}
