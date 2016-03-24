//: Playground - noun: a place where people can play

import UIKit
import DateTools

var str = "Hello, playground"
let date = NSDate().dateBySubtractingDays(2)
date.weekday()

Int(date.timeIntervalSince1970)
extension Int{
    func weekdayString() ->String{
        switch self{
        case 1:
            return "星期一"
        case 2:
            return "星期二"
        case 3:
            return "星期三"
        case 4:
            return "星期四"
        case 5:
            return "星期五"
        case 6:
            return "星期六"
        case 7:
            return "星期日"
        default:
            return ""
        }
    }
}

NSDate().weekday().weekdayString()

let string = "想我我啊是的噶傻大个"
NSUserDefaults.standardUserDefaults().boolForKey("dfhs")

extension UIColor{
    
    var yep_inverseColor: UIColor{
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        print(red)
        return UIColor(red: 1 - red, green: 1 - green, blue: 1 - blue, alpha: alpha)
    }
    
    var yep_binaryColor: UIColor {
        
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        
        return white > 0.92 ? UIColor.blackColor() : UIColor.whiteColor()
    }
}

let color = UIColor(red:0.75, green:0.37, blue:0.35, alpha:1)
color.yep_inverseColor

var white: CGFloat = 0
var alpha: CGFloat = 0
color.getWhite(&white, alpha: &alpha)
white
color.yep_binaryColor

let width: CGFloat = 1.3
round(width)

UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)

UIColor(red: 50/255.0, green: 167/255.0, blue: 255/255.0, alpha: 1.0)

let path = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
path

NSDate().timeIntervalSince1970














