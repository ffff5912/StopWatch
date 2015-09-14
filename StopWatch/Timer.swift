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
    var minutes = 0
    var seconds = 0
    var fractions = 0
    var stopwatchLabel: UILabel
    let updateTime = {(inout incVal: Int, inout initVal: Int) -> () in
        incVal += 1
        initVal = 0
    }
    let formatText = {(current: Int) -> String in
        if current > 9 {
            return "\(current)"
        }
        return "0\(current)"
    }
    
    init(label: UILabel) {
        stopwatchLabel = label
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(
            0.01,
            target: self,
            selector: Selector("updateStopwatch:"),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        fractions = 0
        seconds = 0
        minutes = 0
        currentTime = "00:00.00"
        stopwatchLabel.text = currentTime
    }
    
    func getWatchText(minutes: Int, seconds: Int, fractions: Int, formatter: (value: Int) -> String) -> String {
        var text = ""
        text += formatter(value: minutes) + ":"
        text += formatter(value: seconds) + "."
        text += formatter(value: fractions)
        return text
    }

    func updateStopwatch(timer: NSTimer) {
        fractions += 1
        if fractions == 100 {
            updateTime(&seconds, &fractions)
        }
        
        if seconds == 60 {
            updateTime(&minutes, &seconds)
        }
        
        currentTime = self.getWatchText(minutes, seconds: seconds, fractions: fractions, formatter: formatText)
        stopwatchLabel.text = currentTime
    }
}