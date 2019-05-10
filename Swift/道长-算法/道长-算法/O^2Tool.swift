//
//  O^2Tool.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/18.
//  Copyright © 2019年 LYP. All rights reserved.
//

// 冒泡，选择，插入 的时间复杂度都是O(n^2)

import Cocoa

class O_2Tool: NSObject {

//    冒泡，两两比较，不停的把大的往前放
    func bubbleSort(_ arr: [Int]) -> [Int] {
        var arr = arr;
        for i in 0..<arr.count {
            var flog:Bool = false
            for j in 0..<arr.count{
                if arr[i] > arr[j]{
                    let tmp = arr[i]
                    arr[i] = arr[j]
                    arr[j] = tmp
                    flog = true
                }
            }
            if flog == false{
                break
            }
        }
        return arr
    }
    
//    选择排序,每次取最大的
    func selectSort(_ arr: [Int]) -> [Int] {
        
        var arr = arr
        for i in 0..<arr.count {
            var max_Index = i
            for j in (i+1)..<arr.count{
                if arr[max_Index] < arr[j]{
                    max_Index = j
                }
            }
            
            if (i == max_Index){
                continue
            }
            let tmp = arr[i]
            arr[i] = arr[max_Index]
            arr[max_Index] = tmp
        }
        return arr
    }
    
// 插入排序 往index 中插入最大的值，其他的s值顺位往后移
    func insertSort(_ arr: [Int]) -> [Int] {
        var arr = arr
//        for i in 1..<arr.count{
//            var j = i - 1
//            let value = arr[i]
//            while j >= 0 {
//                if arr[j] < value{
//                    arr.swapAt(j, j+1)
//                }else{
//                    break
//                }
//                j -= 1
//            }
//            arr[j+1] = value
//        }
//        优化
        for i in 1..<arr.count {
            var j = i
            while j > 0 && arr[j] > arr[j - 1]{
                arr.swapAt(j, j - 1)
                j -= 1
            }
        }
        return arr
    }
    
//    归并排序,
    
    
}

