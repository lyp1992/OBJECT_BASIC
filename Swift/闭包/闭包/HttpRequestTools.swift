//
//  HttpRequestTools.swift
//  闭包
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class HttpRequestTools  {
    var complementCallBlock : ((Any) -> Void)?
}

extension HttpRequestTools {
    
//    闭包：1> 无参无返回 ：() -> void
//         2> 有参有返回 : (Any,String,Int) -> String

    func request(_ complementCallBlock : @escaping(Any) -> Void) {
        
        self.complementCallBlock = complementCallBlock
        
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                
                complementCallBlock(123)
            }
        }
    }
}
