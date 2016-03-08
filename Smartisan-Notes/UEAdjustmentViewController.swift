//
//  UEAdjustmentViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class UEAdjustmentViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var switchButton: UISwitch!
    @IBAction func switchToJoinUE(sender: UISwitch) {
        if sender.on{
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: ueAgreeOrNot)
        }else{
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: ueAgreeOrNot)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHTMLForWebView(self.webView)
        setUpUI()
    }
    

    func setUpUI(){
        if NSUserDefaults.standardUserDefaults().boolForKey(ueAgreeOrNot){
            switchButton.setOn(true, animated: false)
        }else{
            switchButton.setOn(false, animated: false)
        }
    }
}
