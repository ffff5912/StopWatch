//
//  RecordRepository.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/20.
//  Copyright © 2015年 ffff5912. All rights reserved.
//

import UIKit
import RealmSwift

class RecordRepository {
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }

    func save(record: Record) {
        do {
            try self.realm.write {
                self.realm.add(record)
            }
        } catch {
            print("realm error")
        }
    }
}
