//
//  Counter.swift
//  方法
//
//  Created by 赖永鹏 on 2019/4/2.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class Counter: NSObject {

    var count = 0
    func increment()  {
        count += 1
    }
    func incrementBy(amount: Int)  {
        count += amount
    }
    
    func reset() {
        count = 0
    }
//    提供外部变量
    func addIncrement(firsr no1: Int,no2: Int) {
        count = no1 * no2
    }
    
    
    let a: Int
    let b: Int
    let res:Int
    init(a: Int,b: Int) {
        self.a = a
        self.b = b
        res = a + b
    }
    
    
    
    
}
