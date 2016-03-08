
//
//  Configs.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

let isNotFirstOpenSmartisanNotes = "isNotFirstOpenSmartisanNotes"
let ueAgreeOrNot = "userAgreeToJoinUEPlan"
let NSBundleURL = NSBundle.mainBundle().bundleURL

struct AppURL {
    static let clockURL = NSURL(string: "notes://")!
    static let syncURL = NSURL(string: "huan-xi-yun-tong-bu-gong-ju://")!
    static let calenderURL = NSURL(string: "smartisan-calendar://")!
    
    static let smartisanWeb = NSURL(string: "https://store.smartisan.com")!
}
struct AppItunsURL {
    static let calenderURL = NSURL(string: "itms-apps://itunes.apple.com/cn/app/smartisan-calendar/id944154964?mt=8")!
    static let syncURL = NSURL(string: "itms-apps://itunes.apple.com/cn/app/huan-xi-yun-tong-bu-gong-ju/id880078620?mt=8")!
    static let clockURL = NSURL(string: "https://geo.itunes.apple.com/cn/app/smartisan-clock/id828812911?mt=8")!
    static let notesURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-notes/id867934588?ls=1&mt=8")!
}

struct AppShareURL {
    static let notesURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-notes/id867934588?ls=1&mt=8")!
}

struct iPhoneInfo{
    static let iOS_Version = UIDevice.currentDevice().systemVersion
    static let deviceName = NSString.deviceName() as String
}

struct AppInfo{
    static let App_Version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
}

struct Configs {
    
    struct Weibo {
        static let appID = "1682079354"
        static let appKey = "94c42dacce2401ad73e5080ccd743052"
        static let redirectURL = "http://www.limon.top"
    }
    
    struct Wechat {
        static let appID = "wx4868b35061f87885"
        static let appKey = "64020361b8ec4c99936c0e3999a9f249"
    }
    
    struct QQ {
        static let appID = "1104881792"
    }
    
    struct Pocket {
        static let appID = "48363-344532f670a052acff492a25"
        static let redirectURL = "pocketapp48363:authorizationFinished" // pocketapp + $prefix + :authorizationFinished
    }
    
    struct Alipay {
        static let appID = "2016012101112529"
    }
}