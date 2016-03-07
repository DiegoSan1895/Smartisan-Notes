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
    let realm = try! Realm()
    lazy var notes: Results<Notes> = {
        self.realm.objects(Notes).sorted("created", ascending: false)
    }()
    
    var alertView: CXAlertView!
    @IBOutlet weak var tableView: UITableView!
    
    // CXAlertView
    @IBOutlet weak var alertContentView: UIView!
    @IBOutlet weak var checkButton: UIButton!
    var isChecked: Bool = true
    
    @IBAction func ueAdjustmentButtonDidPressed(sender: UIButton) {
        // 1.
        alertView.dismiss()
        // 2.
        self.performSegueWithIdentifier(showUEVCIdentifire, sender: self)
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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        populateDefaultNotes()
        
        self.tableView.panGestureRecognizer.addTarget(self, action: "startToScroll")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().boolForKey(isFirstOpenSmartisanNotes){
            alertView = CXAlertView(title: "用户体验改进计划", contentView: alertContentView, cancelButtonTitle: nil)
            alertView.titleFont = UIFont.boldSystemFontOfSize(16)
            alertView.cancelButtonFont = UIFont.boldSystemFontOfSize(16)
            alertView.addButtonWithTitle("确定", type: .Cancel, handler: { (alertView, buttonItem) -> Void in
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: isFirstOpenSmartisanNotes)
                
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
                for _ in 0..<30 {
                    let note = Notes(stared: false, created: NSDate(), contents: "不顾一切的在平坦的路面上曲折前行不顾一切的在平坦的路面上曲折前行不顾一切的在平坦的路面上曲折前行不顾一切的在平坦的路面上曲折前行不顾一切的在平坦的路面上曲折前行不顾一切的在平坦的路面上曲折前行")
                    self.realm.add(note)
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
    @IBAction func aboutButtonDidPressed(sender: UIButton) {
    }
    @IBAction func writeButtonDidPressed(sender: UIButton) {
        performSegueWithIdentifier(writeSegueIdentifier, sender: self)
    }
}



