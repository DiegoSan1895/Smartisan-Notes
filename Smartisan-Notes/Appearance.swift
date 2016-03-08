//
//  Extension.swift
//  Smartisan-Notes
//
//  Created by DiegoSan on 3/5/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit

struct Colors{
    static let textColor = UIColor(red:0.49, green:0.31, blue:0.1, alpha:1)
    static let timeLabelColor = UIColor(red:0.49, green:0.31, blue:0.1, alpha:0.8)
    static let selectedTextBackgroundColor = UIColor(red:0.45, green:0.4, blue:0.38, alpha:1)
}

extension UIButton{
    enum CheckState: Int{
        case checked = 1
        case unchecked = 0
    }

}
