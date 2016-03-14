//
//  ShareViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/4/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import MonkeyKing

class ShareViewController: UIViewController {
    
    // MARK: - IBAction and IBOutlet
    @IBOutlet weak var backGroundView: UIView!

    @IBOutlet weak var footerView: UIView!
    @IBAction func giveUpButtonDidPressed(sender: UIButton) {
        spring(0.1) { () -> Void in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    @IBAction func shareButtonDidPressed(sender: UIButton) {
        
        dealWithShare(sender)
        
    }
    
    // MARK: - SocialMediaInfo
    let weiboAccount = MonkeyKing.Account.Weibo(appID: Configs.Weibo.appID, appKey: Configs.Weibo.appKey, redirectURL: Configs.Weibo.redirectURL)
    var weiboAcccessToken: String?
    
    let wechatAccount = MonkeyKing.Account.WeChat(appID: Configs.Wechat.appID, appKey: Configs.Wechat.appKey)
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add gesture for backGroundView
        let tapGesture = UITapGestureRecognizer(target: self, action: "giveUpButtonDidPressed:")
        self.backGroundView.addGestureRecognizer(tapGesture)
        
        // register accounts
        registerAccounts()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        animateFooterView()
        checkSocialApps()
    }
    
    func animateFooterView(){
        footerView.transform = CGAffineTransformMakeTranslation(0, 300)
        spring(0.3) { () -> Void in
            self.footerView.transform = CGAffineTransformIdentity
        }
    }
    
    // MARK: - helper methods
    func registerAccounts(){
        MonkeyKing.registerAccount(weiboAccount)
        MonkeyKing.registerAccount(wechatAccount)
    }
    
    func checkSocialApps(){
        
        // if the device not installed weibo app, must need accessToken
        if !weiboAccount.isAppInstalled {
            MonkeyKing.OAuth(.Weibo, completionHandler: { [weak self] (dictionary, response, error) -> Void in
                
                if let json = dictionary, accessToken = json["access_token"] as? String{
                    self?.weiboAcccessToken = accessToken
                }
                
                print("dictionary\(dictionary) error \(error)")
            })
        }
        

    }
    func dealWithShare(sender: UIButton) {
        
        let shareWords = "我安装了锤子科技（Smartisan）出品的 iOS 版锤子便签。锤子科技自己认为这可能是史上最漂亮的便签类应用。该应用可将文字生成版式优美的图片长微博。苹果手机用户可到 App Store 下载，下载地址：\(AppItunsURL.notesURL)"
        
        let shareTitle = "分享Smartisan-Notes"
        
        let shareImage = UIImage(named: "note_share_image")!
        switch sender.tag{
            // weibo
        case 1:
            
            let weiboMessage = MonkeyKing.Message.Weibo(.Default(info: (title: shareTitle,
                description: shareWords,
                thumbnail: nil,
                media: .Image(shareImage)
                ), accessToken: weiboAcccessToken))

            MonkeyKing.shareMessage(weiboMessage, completionHandler: { (result) -> Void in
                print("result: \(result)")
            })
            // wechat friends
        case 5:
            
            let wechatFriendsMessage = MonkeyKing.Message.WeChat(.Timeline(info: (title: shareTitle, description: shareWords, thumbnail: nil, media: .Image(shareImage))))
            
            MonkeyKing.shareMessage(wechatFriendsMessage, completionHandler: { (result) -> Void in
                print("result: \(result)")
            })
        default:
            break
        }
    }
}
