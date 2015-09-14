//
//  Timer.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/14.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class Timer: NSObject {
    var timer = NSTimer()
    var currentTime = ""
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var stopwatchLabel: UILabel
    
    init(label: UILabel) {
        stopwatchLabel = label
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateStopwatch:"), userInfo: nil, repeats: true)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        fractions = 0
        seconds = 0
        minutes = 0
        currentTime = "00:00.00"
        stopwatchLabel.text = "00:00.00"
    }
    
    func updateStopwatch(timer: NSTimer) {
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        currentTime = "\(minutesString):\(secondsString).\(fractionsString)"
        stopwatchLabel.text = currentTime
    }
}