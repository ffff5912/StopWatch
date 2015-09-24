//
//  StopWatchTests.swift
//  StopWatchTests
//
//  Created by ffff5912 on 2015/09/12.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit
import XCTest

class StopWatchTests: XCTestCase {
    var stopWatch: StopWatch!
    var standbyButton = UIButton()
    var recordButton = UIButton()
    
    override func setUp() {
        super.setUp()
        stopWatch = StopWatch(label: UILabel())
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testActivation() {
        stopWatch.active(standbyButton, recordButton: recordButton)
        XCTAssertTrue(stopWatch.time != "00:00.00", "タイマーが作動しているか")
        XCTAssertTrue(standbyButton.currentTitle == "STOP", "タイマー動作中のタイトル")
        XCTAssertTrue(recordButton.currentTitle == "LAP", "タイマー動作中のタイトル")
        XCTAssertFalse(stopWatch.standby, "タイマー操作管理フラグ")
        XCTAssertTrue(stopWatch.addLap, "TableViewへの操作管理フラグ")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
