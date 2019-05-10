//
//  ArrayToStack.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class ArrayToStack: NSObject {

    var stack : [AnyObject]
    var isEmpty : Bool {
        return stack.isEmpty
    }
    var peek : AnyObject? {
        return stack.last
    }
    
    override init() {
        stack = [AnyObject]()
    }
    
    func push(_ object: AnyObject) {
        stack.append(object)
    }
    func pop() -> AnyObject? {
        if !isEmpty {
            return stack.removeLast()
        }else{
            return nil
        }
    }
    
}
