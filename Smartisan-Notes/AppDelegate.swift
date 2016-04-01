//
//  AppDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import VENTouchLock
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate{
    
    var window: UIWindow?
    let realm = try! Realm()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        
        VENTouchLock.sharedInstance().setKeychainService(TouchID.service, keychainAccount: TouchID.account, touchIDReason: TouchID.touchIDReason, passcodeAttemptLimit: TouchID.passcodeAttemptLimit, splashViewControllerClass: SubVENTouchLockSplashViewController.classForCoder())
        
        customerAppearance()
        migrateRealmDataBase()
        
        print(NSLocale.preferredLanguages())
        return true
    }
    
    func customerAppearance(){
//        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "titlebar_bg"), forBarMetrics: .Default) 
//        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "btn_bg_p")
        
        UITextView.appearance().tintColor = Colors.textColor
        UITextView.appearance().textColor = Colors.textColor
    }
    
    func migrateRealmDataBase(){
        let config = Realm.Configuration(path: nil,
            inMemoryIdentifier: "realm",
            encryptionKey: nil,
            readOnly: false,
            
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { (migration, oldSchemaVersion) -> Void in
                
            if oldSchemaVersion < 1{
                
                migration.enumerate(Notes.className(), { (oldObject, newObject) -> Void in
                    
                    newObject!["hasPhoto"] = false
                })}
                
            }, objectTypes: nil)
        
        // Tell Realm to use this new configuraiton object for the default Realm
        Realm.Configuration.defaultConfiguration = config
    
    }
}


