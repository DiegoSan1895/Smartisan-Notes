//
//  ContentViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/6/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var note: Notes?
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backGroundScrollView: UIScrollView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.backGroundScrollView.backgroundColor = UIColor(patternImage: UIImage(named: "note_paper_middle")!)
    }
    @IBAction func listBackButtonDidPressed(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
