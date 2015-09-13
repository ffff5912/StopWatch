//
//  StopWatch.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/13.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class StopWatch: NSObject {
    let valueStore = ValueStore()
    var laps: [String] = []
    var timer = NSTimer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var time: String = ""
    var standby: Bool = true
    var addLap: Bool = false
    var stopwatchLabel: UILabel
    
    init(label: UILabel) {
        stopwatchLabel = label
        stopwatchLabel.text = "00:00.00"
    }
        
    func active(standbyButton: UIButton, recordButton: UIButton) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: ("updateStopwatch"), userInfo: nil, repeats: true)
        valueStore.setTitle(standbyButton, record: recordButton, status: "active")
        standby = false
        addLap = true
    }
    
    func passive(standbyButton: UIButton, recordButton: UIButton) {
        timer.invalidate()
        valueStore.setTitle(standbyButton, record: recordButton, status: "passive")
        standby = true
        addLap = false
    }
    
    func reset() {
        fractions = 0
        seconds = 0
        minutes = 0
        time = "00:00.00"
        stopwatchLabel.text = time
    }
        
    func updateStopwatch() {
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
        
        time = "\(minutesString):\(secondsString).\(fractionsString)"
        stopwatchLabel.text = time
    }
}
