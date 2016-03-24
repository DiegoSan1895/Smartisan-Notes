//
//  UIButton+Notes.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/17/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

/*
extension UIButton {
    class func xxx_swizzleSendAction() {
        struct xxx_swizzleToken {
            static var onceToken : dispatch_once_t = 0
        }
        dispatch_once(&xxx_swizzleToken.onceToken) {
            let cls: AnyClass! = UIButton.self
            
            let originalSelector = Selector("sendAction:to:forEvent:")
            let swizzledSelector = Selector("xxx_sendAction:to:forEvent:")
            
            let originalMethod =
            class_getInstanceMethod(cls, originalSelector)
            let swizzledMethod =
            class_getInstanceMethod(cls, swizzledSelector)
            
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
    
    public func xxx_sendAction(action: Selector,
        to target: AnyObject?,
        forEvent event: UIEvent?)
    {
        struct xxx_buttonTapCounter {
            static var count: Int = 0
        }
        
        xxx_buttonTapCounter.count += 1
        print(xxx_buttonTapCounter.count)
        xxx_sendAction(action, to: target, forEvent: event)
    }
}

extension UIButton {
    override public class func initialize() {
        if self != UIButton.self {
            return
        }
        UIButton.xxx_swizzleSendAction()
    }
}

*/

