//
//  AppDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import VENTouchLock


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        // set up VENTouchLock
        //VENTouchLock.sharedInstance().setKeychainService(TouchID.service, keychainAccount: TouchID.account, touchIDReason: TouchID.touchIDReason, passcodeAttemptLimit: TouchID.passcodeAttemptLimit, splashViewControllerClass: SubVENTouchLockSplashViewController.classForCoder())
        return true
    }
}


