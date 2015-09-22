//
//  Stack.swift
//  StopWatch
//
//  Created by ffff5912 on 2015/09/21.
//  Copyright © 2015年 ffff5912. All rights reserved.
//


import UIKit

struct Collection<T>:CollectionProtocol {
    typealias ItemType = T
    var items = [T]()
    var count: Int {
        return items.count
    }
    
    mutating func add(item: T, index: Int = 0) {
        items.insert(item, atIndex: index)
    }
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func remove(index: Int) {
        items.removeAtIndex(index)
    }
    
    mutating func removeAll(capacity: Bool = false) {
        items.removeAll(keepCapacity: capacity)
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
}