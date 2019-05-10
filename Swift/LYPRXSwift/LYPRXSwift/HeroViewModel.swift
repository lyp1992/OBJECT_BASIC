//
//  HeroViewModel.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2019/1/3.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import RxSwift

class HeroViewModel: NSObject {

    var heroObservable : Variable<[Hero]> = {
//       读取路径
        let path = Bundle.main.path(forResource: "heros.plist", ofType: nil)!
        let dataArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        
        var heros : [Hero] = [Hero]()
        for dict in dataArray {
            heros.append(Hero(dict: dict))
        }
        return Variable(heros)
    }()

}
