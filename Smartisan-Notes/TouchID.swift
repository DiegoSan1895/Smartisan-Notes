//
//  TouchID.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import Foundation
import LocalAuthentication

func authenticateUser(){
    
    // 1.
    let context = LAContext()
    
    // 2.
    var error: NSError?
    
    // 3.
    let reasonString = "Authentication is needed to access your notes"
    // 4.
    context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthentication, error: &error)
    
    print(error?.localizedDescription)
}
