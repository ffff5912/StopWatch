//
//  StopWatchTests.swift
//  StopWatchTests
//
//  Created by ffff5912 on 2015/09/12.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import UIKit
import XCTest
import RealmSwift

class StopWatchTests: XCTestCase {
    var stopWatch: StopWatch!
    var recordRepository: RecordRepository!
    var standbyButton = UIButton()
    var recordButton = UIButton()
    
    override func setUp() {
        super.setUp()
        stopWatch = StopWatch(label: UILabel())
        stopWatch.recordRepository.realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "MyInMemoryRealm"))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testActiveStopWatch() {
        stopWatch.active(standbyButton, recordButton: recordButton)
        XCTAssertTrue(stopWatch.time != "00:00.00", "タイマーが作動しているか")
        XCTAssertTrue(standbyButton.currentTitle == "STOP", "タイマー動作中のタイトル")
        XCTAssertTrue(recordButton.currentTitle == "LAP", "タイマー動作中のタイトル")
        XCTAssertFalse(stopWatch.standby, "タイマー操作管理フラグ")
        XCTAssertTrue(stopWatch.addLap, "TableViewへの操作管理フラグ")
    }
    
    func testPassiveStopWatch() {
        stopWatch.passive(standbyButton, recordButton: recordButton)
        XCTAssertEqual(stopWatch.timer.timer, nil, "タイマーが破棄されているか")
        XCTAssertTrue(standbyButton.currentTitle == "START", "タイマー動作中のタイトル")
        XCTAssertTrue(recordButton.currentTitle == "RESET", "タイマー動作中のタイトル")
        XCTAssertTrue(stopWatch.standby, "タイマー操作管理フラグ")
        XCTAssertFalse(stopWatch.addLap, "TableViewへの操作管理フラグ")
    }
    
    func testResetStopWatch() {
        stopWatch.records.add(Record())
        stopWatch.reset()
        XCTAssertFalse(stopWatch.addLap, "TableViewへの操作管理フラグ")
        XCTAssertTrue(stopWatch.records.count == 0)
        XCTAssertTrue(stopWatch.timer.fractions == 0)
        XCTAssertTrue(stopWatch.timer.seconds == 0)
        XCTAssertTrue(stopWatch.timer.minutes == 0)
        XCTAssertTrue(stopWatch.timer.currentTime == "00:00.00")
        XCTAssertTrue(stopWatch.timer.stopwatchLabel.text == "00:00.00")
    }
    
    func testUpdate() {
        stopWatch.timer.currentTime = "11:11.11"
        stopWatch.update()
        let record = stopWatch.recordRepository.realm.objects(Record)
        XCTAssertTrue(record.count == 1, "更新できているか")
        XCTAssertTrue(stopWatch.records.count == 1, "コレクションに追加できているか")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
