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
    var timer: Timer
    var stopwatchLabel: UILabel
    var standby: Bool = true
    var addLap: Bool = false
    var time: String {
        get {
            return timer.currentTime
        }
    }
    
    init(label: UILabel) {
        stopwatchLabel = label
        stopwatchLabel.text = "00:00.00"
        timer = Timer(label: stopwatchLabel)
    }
    
    func active(standbyButton: UIButton, recordButton: UIButton) {
        timer.start()
        valueStore.setTitle(standbyButton, record: recordButton, status: "active")
        standby = false
        addLap = true
    }
    
    func passive(standbyButton: UIButton, recordButton: UIButton) {
        timer.stop()
        valueStore.setTitle(standbyButton, record: recordButton, status: "passive")
        standby = true
        addLap = false
    }
    
    func reset() {
        timer.reset()
    }
}
