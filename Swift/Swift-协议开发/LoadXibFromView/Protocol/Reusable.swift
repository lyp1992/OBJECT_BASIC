//
//  Reusable.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

protocol Reusable {
    
}

extension Reusable {
    static var identify : String{
        return "\(self)"
    }
    static var nib : UINib? {
        return nil
    }
}

extension UITableView {
//    满足两个条件 1> UItableViewCell 2> 遵守Reusable
    func registerCell<T : UITableViewCell>(cell : T.Type) where T : Reusable {
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identify)
        }else{
            register(cell, forCellReuseIdentifier: T.identify)
        }
    }
    func dequeueResuableCell<T: UITableViewCell>(for indexPath : IndexPath) -> T where T : Reusable {
        
        return dequeueReusableCell(withIdentifier: T.identify, for: indexPath) as! T
    }
    
}
