//
//  UIViewController+Notes.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/11/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - Heights

extension UIViewController{
    
    var statusBarHeight: CGFloat {
        
        if let window = view.window {
            let statusFrame = window.convertRect(UIApplication.sharedApplication().statusBarFrame, toView: view)
            return statusFrame.height
        }else {
            return 0
        }
    }
    
    var navigationBarHeight: CGFloat {
        
        if let navigationController = navigationController {
            return navigationController.navigationBar.frame.height
        } else {
            return 0
        }
    }
    
    var topBarsHeight: CGFloat {
        return statusBarHeight + navigationBarHeight
    }
}

// MARK: - openURL

extension UIViewController {
    
    func note_openURL(URL: NSURL) {
        if #available(iOS 9.0, *) {
            
            let safariViewController = SFSafariViewController(URL: URL)
            presentViewController(safariViewController, animated: true, completion: nil)
        } else {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
}
