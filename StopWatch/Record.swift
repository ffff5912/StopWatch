//
//  Record.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/17.
//  Copyright (c) 2015年 ffff5912. All rights reserved.
//

import RealmSwift

class Record: Object {
    dynamic var id = ""
    dynamic var time = ""
    dynamic var createdAt: String = Date.getDateTime()
}
