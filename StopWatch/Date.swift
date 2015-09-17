//
//  Date.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/17.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class Date {
    
    class func getDateTime(format: String = "yyyy/MM/dd HH:mm:ss") -> String {
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = format
        
        return formatter.stringFromDate(now)
    }
}
