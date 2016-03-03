//
//  AboutViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class AboutViewController: UITableViewController {
    
    // MARK: - 更多Smartisan的应用
    // MARK: -------------------
    @IBOutlet weak var clockOpenButton: UIButton!
    @IBOutlet weak var syncOpenButton: UIButton!
    @IBOutlet weak var calenderOpenButton: UIButton!
    
    struct AppURL {
        static let clockURL = NSURL(string: "notes://")!
        static let syncURL = NSURL(string: "huan-xi-yun-tong-bu-gong-ju://")!
        static let calenderURL = NSURL(string: "smartisan-calendar://")!
    }
    struct AppItunsURL {
        static let calenderURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-calendar/id944154964?mt=8")!
        static let syncURL = NSURL(string: "https://itunes.apple.com/cn/app/huan-xi-yun-tong-bu-gong-ju/id880078620?mt=8")!
        static let clockURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-clock/id828812911?mt=8")!
    }
    
    @IBAction func openOrGetButtonDidPressed(sender: UIButton) {
        switch sender.tag{
        case 1:
            if clockCanOpen{
                UIApplication.sharedApplication().openURL(AppURL.clockURL)
            }else{
                UIApplication.sharedApplication().openURL(AppItunsURL.clockURL)
            }
        case 2:
            if syncCanOpen{
                UIApplication.sharedApplication().openURL(AppURL.syncURL)
            }else{
                UIApplication.sharedApplication().openURL(AppItunsURL.syncURL)
            }
        case 3:
            if calenderCanOpen{
                UIApplication.sharedApplication().openURL(AppURL.calenderURL)
            }else{
                UIApplication.sharedApplication().openURL(AppItunsURL.calenderURL)
            }
        default:
            print("")
        }
    }
    
    // MARK: - properties
    private var clockCanOpen: Bool = false{
        didSet{
            if clockCanOpen{
                clockOpenButton.setTitle("打开", forState: .Normal)
            }else{
                clockOpenButton.setTitle("获取", forState: .Normal)
            }
        }
    }
    private var syncCanOpen: Bool = false{
        didSet{
            if syncCanOpen{
                syncOpenButton.setTitle("打开", forState: .Normal)
            }else{
                syncOpenButton.setTitle("获取", forState: .Normal)
            }
        }
    }
    private var calenderCanOpen: Bool = false{
        didSet{
            if calenderCanOpen{
                calenderOpenButton.setTitle("打开", forState: .Normal)
            }else{
                calenderOpenButton.setTitle("获取", forState: .Normal)
            }
        }
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setSmartisanAppsOpenOrGetButtons()
    }
    private func setSmartisanAppsOpenOrGetButtons(){
        // 1.
        if UIApplication.sharedApplication().canOpenURL(AppURL.clockURL){
            clockCanOpen = true
        }else{
            clockCanOpen = false
        }
        // 2.
        if UIApplication.sharedApplication().canOpenURL(AppURL.syncURL){
            syncCanOpen = true
        }else{
            syncCanOpen = false
        }
        // 3.
        if UIApplication.sharedApplication().canOpenURL(AppURL.calenderURL){
            calenderCanOpen = true
        }else{
            calenderCanOpen = false
        }
    }
}

// MARK: - DataSourceAndDelegate
// MARK: - ---------------------
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