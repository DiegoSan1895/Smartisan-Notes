//
//  WriteCell.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/8/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SECoreTextView

class WriteCell: UITableViewCell {
    
    // MARK: - IBActions-IBOutlets
    @IBOutlet weak var textView: SETextView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var charactersCountLabel: UILabel!
    
    @IBAction func starButtonDidPressed(sender: UIButton) {
        
    }
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.textView.text = "在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行\n\n在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行在平坦的路面上曲折前行"
        
        // 1. textView
        self.textView.textColor = Colors.textColor
        self.textView.lineSpacing = 17
        self.textView.font = UIFont.systemFontOfSize(15)
        self.textView.editable = true
        self.textView.selectedTextBackgroundColor = Colors.selectedTextBackgroundColor
        
        
        // 2. labels
        self.timeLabel.textColor = Colors.timeLabelColor
        self.charactersCountLabel.textColor = Colors.timeLabelColor
        
        // 3. set cell's backgroungColor
        self.backgroundColor = UIColor(patternImage: UIImage(named: "note_paper_middle")!)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
