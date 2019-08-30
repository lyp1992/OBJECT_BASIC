//
//  YPString.swift
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import Foundation

class YPString: NSObject {

//    swift 中的string和 oc中的NSString还是有很大的区别
    var emptyStr1 = ""
    var emptyStr2 = String()
    
//   字符串拼接
    var str: String = "1"
    
    func propertyOperation() {
//        拼接
        str.append("2")
        
        //    运算符重载
        str = str + "_3"
        str += "_4"
        
        //    插值
        str = "\(str)_5"
        print("str = \(str)")// 12_3_4_5
        //    前缀后缀
        print(str.hasPrefix("12"))
        print(str.hasSuffix("_4_5"))
        
        //    插入删除
        str.insert("_", at: str.endIndex)
        print(str) // 12_3_4_5_
        str.insert("_", at: str.startIndex) // 1_2_3_4_5_
        print(str)
        str.insert("_", at: str.index(after: str.startIndex))
        print(str) // __12_3_4_5_
        str.insert("_", at: str.index(str.startIndex, offsetBy: 3))
        print(str) // __1_2_3_4_5_
        
        str.insert(contentsOf: "666", at: str.endIndex)
        print(str) // __1_2_3_4_5_666
        
        str.remove(at: str.startIndex)
        print(str)// _1_2_3_4_5_666
        str.removeAll{ $0 == "6" }
        print(str) // _1_2_3_4_5_
        let range = str.index(str.endIndex, offsetBy: -4) ..< str.index(before: str.endIndex)
        str.removeSubrange(range)
        print(str) //_1_2_3__
        
        
/**
         1. subString  string 可以通过prefix 和 suffix 截取字符串得到的不是string类型， 而是substring类型。
         2. substring 和她的base共享数据内存，只有当substring转成 string的时候会重新分配内存
         
**/
        var tmpStr = "12345"
        
        var subStr1 = tmpStr.prefix(3)
        var subStr2 = tmpStr.suffix(3)
        
        let range1 = tmpStr.startIndex..<tmpStr.index(tmpStr.startIndex, offsetBy: 3)
        var subStr3 = tmpStr[range1]
        print(subStr3)
        
//        Value of type 'Substring' has no member 'base' swift 5.0 一下这个属性不可用
//        print(subStr3.base)
        
        
        var str1: String = "jack"
        var str2: NSString = "Danier"
        
        var str3 = str1 as NSString
        var str4 = str2 as String
        
       var str5 = str3.substring(with: NSRange(location: 0, length: 2))
        print(str5)
        
        
    }

    
}
