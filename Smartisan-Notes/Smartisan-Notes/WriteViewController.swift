//
//  WriteViewController.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

class WriteViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        self.textView.backgroundColor = UIColor(patternImage: UIImage(named: "note_paper_middle")!)
    }
    @IBAction func listBackButtonDidPressed(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
