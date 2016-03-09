//
//  TableViewDataSourceAndDelegate.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import RealmSwift

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - dataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! NotesTableViewCell
        cell.note = notes[indexPath.row]
        
        return cell
    }
    
    // MARK: - delegate
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        // change the dataSource
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? NotesTableViewCell{
            selectedCell = cell
        }
        
        performSegueWithIdentifier(contentSequeIdentifier, sender: self)
    }
}


// MARK: - NotesTableViewCellDelegate
extension HomeViewController: NotesTableViewCellDelegate {
    func slideToDelete(cell: NotesTableViewCell) {
        // 1.
        let indexPath = tableView.indexPathForCell(cell)!
        
        // 2.
        try! realm.write { () -> Void in
            realm.delete(notes[indexPath.row])
        }
        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    func longPressureGestureStart(cell: NotesTableViewCell) {
        switch cell.longGesture.state{
        case .Began:
            for cell in getCells(){
                cell.setToHightLightState()
            }
        case .Ended:
            for cell in getCells(){
                cell.setToNormalState()
            }
        default: return
        }
    }
}

// MARK: - segue

extension HomeViewController{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == contentSequeIdentifier{
            if let writeVC = segue.destinationViewController as? WriteViewController{
                writeVC.note = selectedCell?.note
                
                writeVC.stateHelper = 0
            }
        }
    }
}