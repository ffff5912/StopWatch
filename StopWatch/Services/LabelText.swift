//
//  LabelText.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/24.
//  Copyright © 2015年 ffff5912. All rights reserved.
//

import UIKit

enum LabelText {
    case active
    case passive
    
    func getStandbyTitle() -> String {
        switch self {
        case .active:
            return "STOP"
        case .passive:
            return "START"
        }
    }
    
    func getRecordTitle() -> String {
        switch self {
        case .active:
            return "LAP"
        case .passive:
            return "RESET"
        }
    }
}

