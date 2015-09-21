//
//  Collection.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/22.
//  Copyright © 2015年 ffff5912. All rights reserved.
//

import UIKit

protocol Collection {
    typealias ItemType
    mutating func add(item: ItemType, index: Int)
    mutating func push(item: ItemType)
    mutating func remove(index: Int)
    var count: Int {get}
    subscript(i:Int) -> ItemType {get}
}
