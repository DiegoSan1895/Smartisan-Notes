//: Playground - noun: a place where people can play

import UIKit
import DateTools

var str = "Hello, playground"
let date = NSDate().dateBySubtractingDays(2)
date.weekday()

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