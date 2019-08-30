//
//  Observer.swift
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/29.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class Observer: NSObject {

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        print("observeValue",change?[.newKey] as Any,change?[.oldKey] as Any)
        
    }
    
}
