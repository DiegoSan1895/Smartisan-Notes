//
//  AboutViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI
import VENTouchLock

class AboutViewController: UITableViewController {
    
    // MARK: - 更多Smartisan的应用
    // MARK: -------------------
    @IBOutlet weak var clockOpenButton: UIButton!
    @IBOutlet weak var syncOpenButton: UIButton!
    @IBOutlet weak var calenderOpenButton: UIButton!
    
    @IBOutlet var copyFooterView: UIView!
    @IBOutlet var toastButton: UIButton!
    @IBOutlet weak var webTableViewCell: UITableViewCell!
    
    @IBOutlet weak var versionLabel: UILabel!
    
    struct SegueIdentifier{
        static let wechat = "wechat"
        static let weibo = "weibo"
        static let setCode = "setCode"
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
            break
        }
    }
    @IBAction func switchToSetCode(sender: UISwitch) {
        if !sender.on{
            
            // 1.
            let enterPasscodeVC = VENTouchLockEnterPasscodeViewController()
            enterPasscodeVC.title = "请输入密码"
            // 2.
            self.presentViewController(enterPasscodeVC.embeddedInNavigationController(), animated: true, completion: nil)
            
            
        }else{
            // 1.
            let createPasscodeVC = VENTouchLockCreatePasscodeViewController()
            createPasscodeVC.title = "设置密码"
            // 2.
            self.presentViewController(createPasscodeVC.embeddedInNavigationController(), animated: true, completion: nil)
            // 3.
            if VENTouchLock.canUseTouchID(){
                VENTouchLock.setShouldUseTouchID(true)
            }
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
        addGestures()
        self.tableView.tableFooterView = copyFooterView
        self.versionLabel.text = AppInfo.App_Version
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //setSmartisanAppsOpenOrGetButtons()
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
    
    private func addGestures(){
        let tapGesture = UITapGestureRecognizer(target: self, action: "tapToShowStoreWebsite")
        self.webTableViewCell.addGestureRecognizer(tapGesture)
    }
    
    /**
     下面这个方法如果写成 private 会出现 unrecognizer selector exception
     */
    func tapToShowStoreWebsite(){
        let sfVC = SFSafariViewController(URL: AppURL.smartisanWeb)
        presentViewController(sfVC, animated: true, completion: nil)
    }
    
    func sendEmailForAdvices(){
        
        // checking the availability of the composition interface
        if !MFMailComposeViewController.canSendMail(){
            print("Mail service are not available")
        }else{
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            let messageBody: String = "锤子便签版本：\(AppInfo.App_Version)\niOS版本：\(iPhoneInfo.iOS_Version)\n 手机型号：\(iPhoneInfo.deviceName)"
            // configure the fields of the interface
            composeVC.setToRecipients(["iosbug@smartisan.com"])
            composeVC.setSubject("锤子便签（iOS）版反馈")
            composeVC.setMessageBody(messageBody, isHTML: false)
            
            // present the view controller modally
            self.presentViewController(composeVC, animated: true, completion: nil)
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 3{
            if indexPath.row == 1{
                UIApplication.sharedApplication().openURL(AppItunsURL.clockURL)
            }
            if indexPath.row == 2{
                sendEmailForAdvices()
            }
        }
    }
}

// MARK：- 关注我们
// MARK: - ------


// MARK: - prepare for segue
extension AboutViewController{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier{
            
            switch identifier{
            case SegueIdentifier.wechat:
                let destinationVC = segue.destinationViewController as! CopyFooterViewController
                destinationVC.contentString = "复制微信公众号ID后可打开微信进行搜索关注"
                destinationVC.pasteString = "smartisan2013"
            case SegueIdentifier.weibo:
                let destinationVC = segue.destinationViewController as! CopyFooterViewController
                destinationVC.contentString = "复制新浪微博ID后可打开微博进行搜索关注"
                destinationVC.pasteString = "锤子科技"
            default:
                break
                
            }
        
            
        }
    }
}

// MARK: - CopyFooterViewControllerDelegate
// TODO: - delay time hava some exception
extension AboutViewController: CopyFooterViewControllerDelegate{
    func copyingFinished() {
        self.toastButton.hidden = false
        self.toastButton.center = CGPoint(x: self.view.center.x, y: self.tableView.contentSize.height - (UIScreen.mainScreen().bounds.height / 2))
        self.view.addSubview(toastButton)
        
        delay(12) { () -> () in
            self.toastButton.removeFromSuperview()
        }
    }
}

// MARK: - MailComposeVC Delegate
extension AboutViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch result{
        case MFMailComposeResultSent, MFMailComposeResultFailed, MFMailComposeResultSaved:
            controller.dismissViewControllerAnimated(true, completion: nil)
        case MFMailComposeResultCancelled:
            // 1.
            let alertController = UIAlertController(title: "取消选项", message: "message", preferredStyle: .ActionSheet)
            // 2.
            let action1 = UIAlertAction(title: "存储草稿", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                controller.dismissViewControllerAnimated(true, completion: nil)
            })
            let action2 = UIAlertAction(title: "删除草稿", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
                controller.dismissViewControllerAnimated(true, completion: nil)
            })
            // 3.
            alertController.addAction(action1)
            alertController.addAction(action2)
            // 4.
            self.presentViewController(alertController, animated: true, completion: nil)
        default:
            break
        }
    }
}