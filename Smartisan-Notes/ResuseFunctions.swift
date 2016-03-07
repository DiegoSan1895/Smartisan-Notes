//
//  ResuseFunctions.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/7/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

func loadHTMLForWebView(webView: UIWebView){
    
    let mainHTML = NSBundle.mainBundle().URLForResource("statement", withExtension: "html")
    do {
        let contents = try NSString(contentsOfURL: mainHTML!, encoding: NSUTF8StringEncoding)
        // use this method to load local HTML file, don't use loadRequest:
        webView.loadHTMLString(contents as String, baseURL: NSBundleURL)
        webView.scrollView.backgroundColor = UIColor(red:0.4, green:0.45, blue:0.49, alpha:1)
        webView.scrollView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        webView.backgroundColor = UIColor.whiteColor()
        
    }catch let error as NSError{
        print(error.localizedDescription)
    }
}
