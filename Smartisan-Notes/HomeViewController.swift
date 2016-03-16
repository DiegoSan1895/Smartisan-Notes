//
//  HomeViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import RealmSwift
import CXAlertView

let cellIdentifier = "NotesCell"
let writeSegueIdentifier = "writeNote"
let contentSequeIdentifier = "showContent"
let showUEVCIdentifire = "showUEVC"

class HomeViewController: UIViewController {
    
    // MARK: - properties
    let realm: Realm = (UIApplication.sharedApplication().delegate as! AppDelegate).realm
    
    lazy var notes: Results<Notes> = {
        self.realm.objects(Notes).sorted("created", ascending: false)
    }()
    
    var notificationToken: NotificationToken?
    
    var alertView: CXAlertView!
    @IBOutlet weak var tableView: UITableView!
    
    // CXAlertView
    @IBOutlet weak var alertContentView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    var isChecked: Bool = true
    
    var selectedCell: NotesTableViewCell?
    @IBAction func ueAdjustmentButtonDidPressed(sender: UIButton) {
        // 1.
        alertView.dismiss()
        // 2.
        performSegueWithIdentifier(showUEVCIdentifire, sender: self)
    }
    @IBAction func checkToAgreeUEPlanButtonDidPressed(sender: UIButton) {
        
        
        if !isChecked{
            checkButton.setImage(UIImage(named: "icon_check"), forState: .Normal)
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: ueAgreeOrNot)
            isChecked = true
        }else{
            checkButton.setImage(UIImage(named: "icon_uncheck"), forState: .Normal)
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: ueAgreeOrNot)
            isChecked = false
        }
    }
    
    @IBAction func aboutButtonDidPressed(sender: UIButton) {
        
    }
    @IBAction func writeButtonDidPressed(sender: UIButton) {
        
        let writeVC = storyboard?.instantiateViewControllerWithIdentifier("writeAndView") as! WriteViewController
        writeVC.state = .write
        writeVC.note = Notes()
        
        navigationController?.pushViewController(writeVC, animated: true)
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        populateDefaultNotes()
        
        self.tableView.panGestureRecognizer.addTarget(self, action: "startToScroll")
        
        // 在数据库变化的时候执行block里的代码
        notificationToken = notes.addNotificationBlock({ (results, error) -> () in
            //self.tableView.reloadData()
            //已经执行了删除row，这里就不需要再次reloadData了
            
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // if firstEnterApp, show the alertView
        // NSUserDefaults.standardUserDefaults().boolForKey 默认是false
        if !NSUserDefaults.standardUserDefaults().boolForKey(isNotFirstOpenSmartisanNotes){
            alertView = CXAlertView(title: "用户体验改进计划", contentView: alertContentView, cancelButtonTitle: nil)
            alertView.titleFont = UIFont.boldSystemFontOfSize(16)
            alertView.cancelButtonFont = UIFont.boldSystemFontOfSize(16)
            alertView.addButtonWithTitle("确定", type: .Cancel, handler: { (alertView, buttonItem) -> Void in
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: isNotFirstOpenSmartisanNotes)
                
                alertView.dismiss()
            })
            alertView.show()
        }
    }
    
    // set the cell to normal state when scroll
    func startToScroll(){
        let wrapperView = self.tableView.subviews.first
        for subview in (wrapperView?.subviews)!{
            if let notesCell = subview as? NotesTableViewCell{
                notesCell.setToNormalState()
            }
            
        }
    }
    
    // MARK: - private methods
    private func setUpViews() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.tableView.registerNib(UINib(nibName: "NotesTableViewCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: cellIdentifier)
    }
    private func populateDefaultNotes() {
        // 1.
        if notes.count == 0{
            // 2.
            try! realm.write({ () -> Void in
                // 3.
                for _ in 0..<40 {
                    
                    let note = Notes()
                    note.created = NSDate.randomWithinDaysBeforeToday(10)
                    note.contents = String.randomNoteContent()
                    note.hasPhoto = Bool.random()
                    note.stared = Bool.random()
                    
                    realm.add(note)
                }
                
            })
        }
    }
    
    func getCells() -> [NotesTableViewCell] {
        var resultCells = [NotesTableViewCell]()
        
        let wrapperView = self.tableView.subviews.first
        for subview in (wrapperView?.subviews)!{
            if let notesCell = subview as? NotesTableViewCell{
                resultCells.append(notesCell)
            }
        }
        
        return resultCells
    }
    
    // MARK: - set statusBar
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}



