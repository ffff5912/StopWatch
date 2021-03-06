//
//  StopWatch.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/13.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

class StopWatch: NSObject {
    var timer: Timer
    var stopwatchLabel: UILabel
    var standby: Bool = true
    var addLap: Bool = false
    var time: String {
        return timer.currentTime
    }
    var records = Collection<Record>()
    let recordRepository = RecordRepository()
    
    init(label: UILabel) {
        stopwatchLabel = label
        stopwatchLabel.text = "00:00.00"
        timer = Timer(label: stopwatchLabel)
    }
    
    func active(standbyButton: UIButton, recordButton: UIButton) {
        timer.start()
        standbyButton.setTitle(LabelText.active.getStandbyTitle(), forState: .Normal)
        recordButton.setTitle(LabelText.active.getRecordTitle(), forState: .Normal)
        standby = false
        addLap = true
    }
    
    func passive(standbyButton: UIButton, recordButton: UIButton) {
        timer.stop()
        standbyButton.setTitle(LabelText.passive.getStandbyTitle(), forState: .Normal)
        recordButton.setTitle(LabelText.passive.getRecordTitle(), forState: .Normal)
        standby = true
        addLap = false
    }
    
    func reset() {
        self.addLap = false
        self.records.removeAll()
        timer.reset()
    }
    
    func update() {
        let record = Record(value: ["time": self.time])
        self.recordRepository.save(record)
        self.records.add(record)
    }
    
}
