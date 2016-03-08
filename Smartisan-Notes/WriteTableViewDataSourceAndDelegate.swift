//
//  WriteTableViewDataSourceAndDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/8/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

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
        let height:CGFloat = CGFloat(Int((CGFloat(Double(note.contents.characters.count) * 2) / 38)) * 38)
    
        return height
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let imageView = UIImageView(image: UIImage(named: "note_paper_bottom"))
        return imageView
    }
}
