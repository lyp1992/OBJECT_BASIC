//
//  SetAndDict.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa


class SetAndDict: NSObject {
// two num 给定一个数组nums和一个target目标值，判断lnums中是否有两个数和等于target
    func twoNum(_ nums: [Int],_ target: Int) -> Bool {
        var set = Set<Int>()
        for num in nums {
            if set.contains(target - num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
//    返回下标
    func twoNum2(_ nums: [Int],_ target: Int) -> [Int] {
        
        var dict = [Int : Int]()
        for (i,num) in nums.enumerated() {
            if let lastIndex = dict[target - num]{
                return [lastIndex,i]
            }else{
                dict[num] = i
            }
        }
        fatalError("NO Valid Output")
    }
    
}
