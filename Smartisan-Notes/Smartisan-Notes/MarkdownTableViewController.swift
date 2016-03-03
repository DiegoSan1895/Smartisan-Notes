//
//  MarkdownTableViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/3/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class MarkdownTableViewController: UITableViewController {
    @IBOutlet weak var switchButton: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "启用Markdown模式"
    }
    @IBAction func switchToOpenMarkdown(sender: UISwitch) {
        
    }
}
