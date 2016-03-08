//
//  WriteViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import RealmSwift

class WriteViewController: UIViewController {
    
    enum State: Int{
        case write = 0
        case view
    }
    // MARK:- IBOutlets

    @IBOutlet var tableViewHeaderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    // tableViewHeaderView
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var numberOfCharactersLabel: UILabel!
    @IBOutlet weak var staredButton: UIButton!
    
    // navigationBar
    @IBOutlet weak var cameraAndDeleteButton: UIButton!
    @IBOutlet weak var doneAndShareButton: UIButton!
    
    let realm = try! Realm()
    var stared: Bool = false
    
    var state: State?
    
    var note:Notes!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        saveNote()
    }
    
    // MARK: - IBAcitons
    @IBAction func listBackButtonDidPressed(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func staredButtonDidPressed(sender: UIButton) {
        stared = !stared
        if stared{
            staredButton.setImage(UIImage(named: "star_big_selected"), forState: .Normal)
        }else{
            staredButton.setImage(UIImage(named: "star_big_normal"), forState: .Normal)
        }
    }

    
    // Appearance
    override func prefersStatusBarHidden() -> Bool {
        return false
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // 
    func saveNote(){

    }
    
    func setUpUI(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.tableView.backgroundColor = UIColor.clearColor()
        self.timeLabel.text = "        \(NSDate().description)"
        
        self.tableView.estimatedRowHeight = 500
        //self.tableView.rowHeight = UITableViewAutomaticDimension
    }
}

