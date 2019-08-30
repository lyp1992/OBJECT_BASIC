//
//  ViewController.swift
//  swift5.0
//
//  Created by 赖永鹏 on 2019/8/9.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    class Size{
        var width: Int
        var height: Int
        init(width: Int, height: Int) {
            self.width = width
            self.height = height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//   // 值类型赋值是将内容重新拷贝一份，属于深拷贝
//        struct Point {
//            var x: Int
//            var y: Int
//        }
//
//        let p1 = Point(x: 10, y: 20)
//        let p2 = p1
        
        test()
        
    }
  

    func test(){
        // 指针类型赋值 是将指针重新拷贝一份，指向的是d同一份内存，所以是浅拷贝
        let s1 = Size(width: 10, height: 20)
        let s2 = s1
        s2.width = 30
        
        print("s1.width = \(s1.width) s2.width = \(s2.width)  ")
    }
}

