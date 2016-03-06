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
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var textViewHeaderView: UIView!

    
    let realm = try! Realm()
    var stared: Bool = false
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
    }
    @IBAction func listBackButtonDidPressed(sender: UIButton) {
        saveNote()
        self.navigationController?.popViewControllerAnimated(true)
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
        if textView.text != ""{
            try! realm.write({ () -> Void in
                let newNote = Notes(stared: stared, created: NSDate(), contents: self.textView.text)
                self.realm.add(newNote)
            })
        }
    }
    
    func setUpUI(){
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.textView.backgroundColor = UIColor(patternImage: UIImage(named: "note_paper_middle")!)
        self.textView.textContainerInset = UIEdgeInsets(top: 54, left: 24, bottom: 450, right: 24)
        
        self.textViewHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        self.textView.addSubview(textViewHeaderView)
        
        self.textView.text = ""
    }
}
