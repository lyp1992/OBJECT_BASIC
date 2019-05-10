//
//  MathTools.swift
//  闭包
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class MathTools {
    
//    函数重载，函数名相同但是参数不同 1> 参数个数不同，2>参数名称类型不同
    class func sum(_ num1 : Int ,num2 : Int) -> Int {
        return num1 + num2
    }
    
    class func sum(_ num1 : CGFloat, num2 : CGFloat) -> CGFloat {
        return num2 + num1
    }
    
    class func sum(_ num1 : Int, num2 : Int, num3 : Int) -> Int {
        return num1 + num2 + num3
    }
}
