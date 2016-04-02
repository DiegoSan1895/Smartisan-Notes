//
//  WriteCell.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/8/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SECoreTextView

@objc protocol WriteCellDelegate{
    func stateBecomeView()
    func stateBecomeWrite()
}
class WriteCell: UITableViewCell, SETextViewDelegate{
    
    // MARK: - IBActions-IBOutlets
    @IBOutlet weak var textView: SETextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var charactersCountLabel: UILabel!
    
    @IBAction func starButtonDidPressed(sender: UIButton) {
        isStared = isStared == false ? true : false
        note.stared = isStared
    }
    
    @IBOutlet weak var delegate: WriteCellDelegate?
    
    var note:Notes!{
        didSet{
            self.textView.text = note.contents
            
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
            self.timeLabel.text = timeString
            
            
            // starButton image
            if note.stared{
                self.starButton.setImage(UIImage(named: "star_big_selected"), forState: .Normal)
            }else{
                self.starButton.setImage(UIImage(named: "star_big_normal"), forState: .Normal)
            }
            
            // charactersCountLabel
            self.charactersCountLabel.text = "\(note.contents.characters.count)"
        }
    }
    
    var isStared: Bool = false {
        didSet{
            if isStared {
                starButton.setImage(UIImage(named: "star_big_selected"), forState: .Normal)
                
            }else {
                starButton.setImage(UIImage(named: "star_big_normal"), forState: .Normal)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 1. textView
        self.textView.textColor = Colors.textColor
        self.textView.lineSpacing = 17
        self.textView.font = UIFont.systemFontOfSize(15)
        self.textView.editable = true
        self.textView.selectedTextBackgroundColor = Colors.selectedTextBackgroundColor
        self.textView.delegate = self
        self.textView.tintColor = Colors.textColor
        
        // 2. labels
        self.timeLabel.textColor = Colors.timeLabelColor
        self.charactersCountLabel.textColor = Colors.timeLabelColor
        
        // 3. set cell's backgroungColor
        var image: UIImage?
        if UIScreen.mainScreen().bounds.width == 375{
            image = UIImage(named: "note_paper_middle_iphone6")
        }else{
            image = UIImage(named: "note_paper_middle")!
        }
        self.backgroundColor = UIColor(patternImage: image!)
        

        
    }
    
    // MARK: - TextViewDelegate
    
    func textViewDidChangeSelection(textView: SETextView!) {
        if let caretView = textView.subviews.last{
            caretView.backgroundColor = Colors.textColor
            
            let frame = CGRect(x: caretView.frame.origin.x, y: caretView.frame.origin.y + caretView.frame.height * 0.25, width: caretView.frame.width, height: caretView.frame.height * 0.75)
            caretView.frame = frame
        }
    }
    
    func textViewDidChange(textView: SETextView!) {
        self.charactersCountLabel.text = "\(textView.text.characters.count)"
    }
    
    func textViewDidBeginEditing(textView: SETextView!) {
        
        if let VC = self.parentViewController as? WriteCellDelegate{
            self.delegate = VC
        }
        
        self.delegate?.stateBecomeWrite()
    }
    
    func textViewDidEndEditing(textView: SETextView!) {
        self.delegate?.stateBecomeView()
    }

}
