//
//  WriteTableViewDataSourceAndDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/8/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SECoreTextView

let contentCellIdentifier = "contentCell"
extension WriteViewController: UITableViewDelegate, UITableViewDataSource{
    
    // MARK: - dataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier(contentCellIdentifier) as! WriteCell
        
        cell.note = self.note
    
        return cell
    }
    
    
    // MARK:  - delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        // 为了不出现背景图片半截的情况，这里取到patternImage.height==38，然后设成38的整数倍
        
        let attributedString = NSAttributedString(string: note.contents)
        let textViewRect = SETextView.frameRectWithAttributtedString(attributedString, constraintSize: CGSize(width: 300, height: 300), lineSpacing: 17, font: UIFont.systemFontOfSize(15))
        let height:CGFloat = CGFloat(Int(textViewRect.height / 38) * 38)
        
        return max(height, 608)
    }
    

}
