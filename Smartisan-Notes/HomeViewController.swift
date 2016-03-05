//
//  HomeViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import RealmSwift

let cellIdentifier = "NotesCell"
let writeSegueIdentifier = "writeNote"


class HomeViewController: UIViewController {
    
    // MARK: - properties
    let realm = try! Realm()
    lazy var notes: Results<Notes> = {
        self.realm.objects(Notes)
    }()
    
    @IBOutlet weak var tableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        populateDefaultNotes()
        
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



