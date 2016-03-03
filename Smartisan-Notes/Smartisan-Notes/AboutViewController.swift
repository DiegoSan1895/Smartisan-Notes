//
//  AboutViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController {
    @IBOutlet weak var clockOpenButton: UIButton!
    @IBOutlet weak var syncOpenButton: UIButton!
    @IBOutlet weak var calenderOpenButton: UIButton!
    
    
    @IBAction func openOrGetButtonDidPressed(sender: UIButton) {
        
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSmartisanAppsOpenOrGetButtons()
    }
    private func setSmartisanAppsOpenOrGetButtons(){
        
    }
}

// MARK: - DataSourceAndDelegate

extension AboutViewController {
    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 6 {
            let footerView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.tableView.bounds.width, height: 160)))
            footerView.backgroundColor = UIColor.brownColor()
            return nil
        }else {
            return nil
        }
    }
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 6{
            let headerViewToHideSeparateLine = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: self.tableView.bounds.width, height: 1)))
            headerViewToHideSeparateLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
            return headerViewToHideSeparateLine
        }else{
            return nil
        }
    }
}