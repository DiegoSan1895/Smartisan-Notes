//
//  SubVENTouchLockSplashViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/5/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import VENTouchLock

class SubVENTouchLockSplashViewController: VENTouchLockSplashViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showPasscodeAnimated(false)
        if VENTouchLock.canUseTouchID() && VENTouchLock.sharedInstance().isPasscodeSet(){
            self.showTouchID()
        }
    }
}
