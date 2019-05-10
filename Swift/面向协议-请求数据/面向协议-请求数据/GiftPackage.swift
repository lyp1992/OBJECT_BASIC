//
//  GiftPackage.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class GiftPackage: NSObject {

    @objc var t : Int = 0
    @objc var giftModes : [GiftModel] = []
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "list" {
            if let listArray = value as? [[String :Any]] {
                for dict in listArray {
                    self.giftModes.append(GiftModel(dict: dict))
                }
            }
        }else{
            super.setValue(value, forKey: key)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}
