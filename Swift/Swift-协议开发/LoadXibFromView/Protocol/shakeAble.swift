//
//  shakeAble.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

protocol shakeAble {
    
}

extension shakeAble where Self :UIView{
    
    func shakeing() {
        
//        创建动画
        let shakeAnim = CAKeyframeAnimation(keyPath:"transform.translation.x" )
        
//        给动画设置属性
        shakeAnim.values = [-8,0,8,0]
        shakeAnim.duration = 0.1
        shakeAnim.repeatCount = 3
        
//        将动画添加到layer中
        layer.add(shakeAnim, forKey: nil)
    }
    
}
