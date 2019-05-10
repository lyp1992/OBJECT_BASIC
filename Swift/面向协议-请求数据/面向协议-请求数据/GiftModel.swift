//
//  GiftModel.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class GiftModel: NSObject {

   @objc var img2 : String = ""
   @objc var subject : String = "" {
        didSet {
            if subject.contains("(有声)") {
                subject = subject.replacingOccurrences(of: "(有声)", with:"")
            }
        }
    }
   @objc var gUrl : String = ""
   @objc var coin : Int = 0
    
    init(dict:[String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
