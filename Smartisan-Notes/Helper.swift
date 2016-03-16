//
//  ResuseFunctions.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/7/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

func loadHTMLForWebView(webView: UIWebView){
    
    var mainHTML: NSURL{
        let languages = ["zh-Hans-US", "en-US", "zh-Hant-US"]
        
        if NSLocale.preferredLanguages().first == languages[0]{
            return NSBundle.mainBundle().URLForResource("statement", withExtension: "html")!
        }else if NSLocale.preferredLanguages().first == languages[1]{
            return NSBundle.mainBundle().URLForResource("statement_en", withExtension: "html")!
        }else if NSLocale.preferredLanguages().first == languages[2]{
            return NSBundle.mainBundle().URLForResource("statement_tw", withExtension: "html")!
        }else{
            return NSBundle.mainBundle().URLForResource("statement_en", withExtension: "html")!
        }
    }
    
    do {
        let contents = try NSString(contentsOfURL: mainHTML, encoding: NSUTF8StringEncoding)
        // use this method to load local HTML file, don't use loadRequest:
        webView.loadHTMLString(contents as String, baseURL: NSBundleURL)
        webView.scrollView.backgroundColor = UIColor(red:0.4, green:0.45, blue:0.49, alpha:1)
        webView.scrollView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        webView.backgroundColor = UIColor.whiteColor()
        
    }catch let error as NSError{
        print(error.localizedDescription)
    }
}

extension Int{
    func weekdayString() ->String{
        switch self{
        case 1:
            return "星期一"
        case 2:
            return "星期二"
        case 3:
            return "星期三"
        case 4:
            return "星期四"
        case 5:
            return "星期五"
        case 6:
            return "星期六"
        case 7:
            return "星期日"
        default:
            return ""
        }
    }
}

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func subviewsResignFirstResponder(){
        
    }
}

extension String{
    
    static func randomNoteContent() -> String{
        var string = "不顾一切的在平坦的路面上曲折前行"
        let count = Int.random(1, 10)
        
        for _ in 0..<count {
           string += string
        }
        
        return string
    }
}