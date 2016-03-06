//
//  AppDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import VENTouchLock
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        // set up VENTouchLock
        //VENTouchLock.sharedInstance().setKeychainService(TouchID.service, keychainAccount: TouchID.account, touchIDReason: TouchID.touchIDReason, passcodeAttemptLimit: TouchID.passcodeAttemptLimit, splashViewControllerClass: SubVENTouchLockSplashViewController.classForCoder())
        
        //IQKeyboardManager.sharedManager().enable = true
        customerAppearance()
        return true
    }
    
    func customerAppearance(){
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "titlebar_bg"), forBarMetrics: .Default) 
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "btn_bg_p")
        UITextView.appearance().tintColor = Colors.textColor
        UITextView.appearance().textColor = Colors.textColor
    }
}


