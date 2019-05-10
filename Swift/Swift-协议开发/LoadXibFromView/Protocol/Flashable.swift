//
//  Flashable.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

protocol Flashable {
    
}

extension Flashable where Self : UIView {
    
    func flashing() {
        
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 0.0
            }, completion: { (_) in
                
            })
        }
    }
    
}
