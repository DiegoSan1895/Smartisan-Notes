//
//  SelectedFooterTableViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/3/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class SelectedFooterTableViewController: UITableViewController {
    @IBOutlet weak var SmartisanCheckedImageView: UIImageView!
    @IBOutlet weak var SomeoneCheckedImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "便签分享时的页脚显示"
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            SmartisanCheckedImageView.hidden = false
            SomeoneCheckedImageView.hidden = true
        }else{
            SmartisanCheckedImageView.hidden = true
            SomeoneCheckedImageView.hidden = false
        }
    }
}
