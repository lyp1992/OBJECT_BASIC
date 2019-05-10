//
//  ViewController.swift
//  闭包
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var httpReuqest : HttpRequestTools = HttpRequestTools()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mathT = MathTools.sum(1.2, num2: 3.1)
        print(mathT)
        let math2 = MathTools.sum(1, num2: 2)
        print(math2)
        let math3 = MathTools.sum(1, num2: 2, num3: 3)
        print(math3)
        /*
         // weak为什么只能用来修饰可选类型/不能和let一起使用
         // weak: 当对象销毁时, 会自动将指针指向nil
//       弱引用： weak/__unsafe_unretained
         1. weak ：当对象销毁时，会自动将指针指向nil
         2. __unsafe_unretained : 当对象销毁时, 会依然指向之前的内存地址. 那么如果继续访问之前的内存很容易引起野指针错误(访问僵尸对象)
         
        */
//        解决循环引用的问题
//        1 >
//        httpReuqest.request { [weak self] (result) in
//            print(result)
//            self?.view.backgroundColor = UIColor.purple
//        }
//        2>
//        weak var weakSelf : ViewController? = self
//        httpReuqest.request { (result) in
//            weakSelf?.view.backgroundColor = UIColor.purple
//        }
//        3>
        // unowned : __unsafe_unretained
        httpReuqest.request { [unowned self] (result) in
            self.view.backgroundColor = UIColor.purple
        }
        
        let abc = test1
        abc(345)
    }
    
    func test1(_ result : Any)  {
        print(result)
    }


    deinit {
        print("ViewController 销毁掉")
    }
    
}

