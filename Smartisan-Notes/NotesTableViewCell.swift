//
//  NotesTableViewCell.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/2/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import DateTools
import RealmSwift

protocol NotesTableViewCellDelegate: class {
    func slideToDelete(cell: NotesTableViewCell)
    func longPressureGestureStart(cell: NotesTableViewCell)
}
class NotesTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var createdTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var clipImageView: UIImageView!
    @IBOutlet weak var staredButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var cameraImageView: UIImageView!
    
    // MARK: - properties
    
    let realm = try! Realm()
    
    var isStared: Bool = false {
        didSet{
            if isStared {
                staredButton.setImage(UIImage(named: "star_big_selected"), forState: .Normal)

            }else {
                staredButton.setImage(UIImage(named: "star_big_normal"), forState: .Normal)
            }
        }
    }
    
    
    var slided: Bool = false
    
    var note: Notes? {
        didSet{
            if let note = note{
                self.contentLabel.text = note.contents
                self.isStared = note.stared
                
                // create the time string with format
                let date = note.created
                var day: String = ""
                
                switch date.daysAgo(){
                case 0:
                    day = "今天"
                case 1:
                    day = "昨天"
                case 2..<7:
                    day = "\((date.weekday()-1).weekdayString())"
                default:
                    day = "\(date.daysAgo())天前"
                }
                
                let timeString = "\(day) \(date.hour()):\(date.minute())  \(date.year())年\(date.month())月\(date.day())日"
                self.createdTimeLabel.text = timeString
            }
        }
    }
    
    weak var delegate: NotesTableViewCellDelegate?
    
    var longGesture: UILongPressGestureRecognizer!
    // MARK: - Constants
    // MARK: - lifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clearColor()
        
        // set delegate
        if let navigationController = UIApplication.sharedApplication().delegate?.window??.rootViewController as? UINavigationController {
            if let homeViewController = navigationController.topViewController as? HomeViewController{
                self.delegate = homeViewController
            }
        }
        
        addGestures()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        setToNormalState()
    }
    
    // add swipeGesture
    func addGestures(){
        // 1.
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "swipeAnimation")
        swipeGesture.direction = [UISwipeGestureRecognizerDirection.Right, UISwipeGestureRecognizerDirection.Left]
        self.addGestureRecognizer(swipeGesture)
        
        // 2.
        longGesture = UILongPressGestureRecognizer(target: self, action: "longGestureStart")
        //self.addGestureRecognizer(longGesture)
        
    }
    func swipeAnimation() {
        
        if slided {
            setToNormalState()
        }else {
            spring(0.4, animations: { () -> Void in
                self.containerView.transform = CGAffineTransformMakeTranslation(self.deleteButton.bounds.width * 0.8, 0)
                self.clipImageView.image = UIImage(named: "clip_p")
            })
        }
        
        slided = slided == true ? false : true
    }
    
    func setToNormalState(){
        
        spring(0.4) { () -> Void in
            self.clipImageView.image = UIImage(named: "clip_n")
            self.containerView.transform = CGAffineTransformIdentity
        }
    }
    
    func setToHightLightState(){
        self.clipImageView.image = UIImage(named: "clip_p")
    }
    
    func longGestureStart(){
       self.delegate?.longPressureGestureStart(self)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - IBActions
    @IBAction func staredButtonDidPressed(sender: UIButton) {
        isStared = isStared == false ? true : false
        
        try! realm.write({ () -> Void in
            
            //realm.create(Notes.self, value: ["id": id, "stared": isStared], update: true)
        })
    }
    @IBAction func deleteButtonDidPressed(sender: UIButton) {
        self.delegate?.slideToDelete(self) 
    }
    
}

