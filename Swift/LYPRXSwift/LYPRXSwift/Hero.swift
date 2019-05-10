//
//  Hero.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2019/1/3.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class Hero: NSObject {

   @objc var name : String = ""
   @objc var icon : String = ""
   @objc var intro : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    
}
