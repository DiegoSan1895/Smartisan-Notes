//
//  AboutViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SafariServices

class AboutViewController: UITableViewController {
    
    // MARK: - 更多Smartisan的应用
    // MARK: -------------------
    @IBOutlet weak var clockOpenButton: UIButton!
    @IBOutlet weak var syncOpenButton: UIButton!
    @IBOutlet weak var calenderOpenButton: UIButton!
    
    @IBOutlet var copyFooterView: UIView!
    
    struct AppURL {
        static let clockURL = NSURL(string: "notes://")!
        static let syncURL = NSURL(string: "huan-xi-yun-tong-bu-gong-ju://")!
        static let calenderURL = NSURL(string: "smartisan-calendar://")!
        
        static let smartisanWeb = NSURL(string: "https://store.smartisan.com")!
    }
    struct AppItunsURL {
        static let calenderURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-calendar/id944154964?mt=8")!
        static let syncURL = NSURL(string: "https://itunes.apple.com/cn/app/huan-xi-yun-tong-bu-gong-ju/id880078620?mt=8")!
        static let clockURL = NSURL(string: "https://itunes.apple.com/us/app/smartisan-clock/id828812911?mt=8")!
    }
    
    struct SegueIdentifier{
        static let wechat = "wechat"
        static let weibo = "weibo"
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

// MARK：- 关注我们
// MARK: - ------
extension AboutViewController{
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 5{
            switch indexPath.row{
            case 0:
                print("")
            case 1:
                print("")
            default:
                let sfVC = SFSafariViewController(URL: AppURL.smartisanWeb)
                presentViewController(sfVC, animated: true, completion: nil)
            }
        }
    }
    
    func setCopyFooterView(){
        let width = UIScreen.mainScreen().bounds.width
        let height = UIScreen.mainScreen().bounds.height
        let kHeight = CGFloat(120)
        self.copyFooterView.frame = CGRect(x: 0, y: height - kHeight, width: width, height: kHeight)
        self.view.addSubview(copyFooterView)
    }
}

// MARK: - prepare for segue
extension AboutViewController{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            
            switch identifier{
            case SegueIdentifier.wechat:
                let destinationVC = segue.destinationViewController as! CopyFooterViewController
                destinationVC.contentString = "复制新浪微博ID后可打开微博进行搜索关注"
                destinationVC.pasteString = "smartisan2013"
            case SegueIdentifier.weibo:
                let destinationVC = segue.destinationViewController as! CopyFooterViewController
                destinationVC.contentString = "复制新浪微博ID后可打开微博进行搜索关注"
                destinationVC.pasteString = "锤子科技"
            default:
                print("")
                
            }
        
            
        }
    }
}

// MARK: - CopyFooterViewControllerDelegate
extension AboutViewController: CopyFooterViewControllerDelegate{
    func copyingFinished() {
        let toastView = UIButton()
        toastView.setBackgroundImage(UIImage(named: "iOSbtnBg"), forState: .Normal)
        toastView.userInteractionEnabled = false
        toastView.setTitle("复制成功", forState: .Normal)
    }
}