//
//  UEAdjustmentViewController2.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/7/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class UEAdjustmentViewController2: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHTMLForWebView(self.webView)
    }
}
