
//
//  Configs.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit


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
    static let notesURL = NSURL(string: "itms-apps://itunes.apple.com/cn/app/chui-zi-bian-qian/id867934588?mt=8")!
}

struct iPhoneInfo{
    static let iOS_Version = UIDevice.currentDevice().systemVersion
    static let deviceName = NSString.deviceName() as String
}

struct AppInfo{
    static let App_Version = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
}