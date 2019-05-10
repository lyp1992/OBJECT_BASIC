//
//  NibLoadable.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

protocol NibLoadable {
    
}

extension NibLoadable where Self : UIView {
    
    static func loadXibFromView(nibName:String? = nil) ->Self{
//        let name  = nibName != nil ? nibName! : "\(self)"
        let name = nibName ?? "\(self)"
        
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as! Self
    }
    
}
