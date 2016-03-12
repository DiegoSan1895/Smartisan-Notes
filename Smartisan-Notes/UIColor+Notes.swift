//
//  Extensions.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/10/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

extension UIColor{
    
    class func noteTextColor() -> UIColor{
        return UIColor(red:0.49, green:0.31, blue:0.1, alpha:1)
    }
    
    class func noteSubTextColor() -> UIColor{
        return UIColor.noteTextColor().colorWithAlphaComponent(0.7)
    }
    
    // 反色
    var note_inverseColor: UIColor{
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: alpha)
    }
    
    // 黑白色
    var note_binaryColor: UIColor{
        var white: CGFloat = 0
        var alpha: CGFloat = 0
        
        getWhite(&white, alpha: &alpha)
        return white > 0.92 ? UIColor.blackColor() : UIColor.whiteColor()
    }
}
