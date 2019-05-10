//
//  String.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class StringTool: NSObject {

//    基础定义
    func baseInfo(){
//        数字和str互转
        var str = "3"
        let num = Int(str)
        let number = 3
        let string = String(number)
        
//        字符串长度
        let lenght = string.count
//        访问字符串的单个字符 时间复杂度为O(1)
        let char = str[str.index(str.startIndex, offsetBy: 1)]
       
//        移除字符串
        str.remove(at: string.startIndex)
        str.append("2")
        str += "hello world"
        
    }
//    检验字符串是否由数字组成
    func isStrNum(_ str: String) -> Bool{
        return Int(str) != nil
    }
    
//    将字符串中的字符排序，从小到大
    func sortStr(_ str: String) -> String {
        return String(str.sorted())
    }
    
    //    算法-实现一个字符串翻转的功能 eg:the sky is blue -> blue is sky the
   private func _reverse<T>(_ chars: inout[T],_ start: Int,_ end: Int){
        var start = start ,end = end
        while start < end {
            _swapStr(&chars, start, end)
            start += 1
            end -= 1
        }
    }
    
   private func _swapStr<T>(_ chars: inout[T],_ q: Int,_ p: Int){
        (chars[p],chars[q]) = (chars[q],chars[p])
    }
    
    func reverseWords(str: String?) -> String? {
        
        guard let str = str  else{
            return nil
        }
        var strs = Array(str),start = 0
        _reverse(&strs, 0, strs.count - 1) // eulb si yks eht
        
        for i in 0..<strs.count {
            if i == strs.count - 1 || strs[i + 1] == " "{
                _reverse(&strs, start, i)
                start = i + 2
            }
        }
        
        return String(strs)
    }
    
}
