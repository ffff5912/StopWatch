//
//  ButtonValueStore.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/13.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit

struct ValueStore {
    let standbyTitle = ["active": "STOP", "passive": "START"]
    let recordTitle = ["active": "LAP", "passive": "RESET"]
    
    func setTitle(standby: UIButton, record: UIButton, status: String) {
        standby.setTitle(standbyTitle[status]!, forState: .Normal)
        record.setTitle(recordTitle[status]!, forState: .Normal)
    }
}
