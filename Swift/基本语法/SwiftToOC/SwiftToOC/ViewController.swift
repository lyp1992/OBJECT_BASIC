//
//  ViewController.swift
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/26.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    struct Dog {
        var name = "dog"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var dog1 = Dog(name: "dog1")
        var dog2:Dog
        dog2 = dog1
        dog1.name = "dog111"
        print(dog1.name, dog2.name)
        
        
//        let p = Person(age: 10, withName: "lyx")
//        p.run()
/*
当c 语言的名字和swift暴露的名字冲突的时候 @_silgen_name("sum")
*/
//        Use of 'sum' nearly matches global function 'sum' in module '__ObjC' rather than instance method 'sum(a:b:)'
//        print(sum(10, 20))
//        print(swift_sum(a: 15, b: 10))
        
        
//        let str = YPString()
//        str.propertyOperation()
        
        
//        let dog = Dog()
//          dog.test()
////        dog.run1()
////        dog.run2()
//
//        dog.test1()
        
        let stu = Student()
        stu.age = 10
        stu.name = "lyx"
        stu.weight = 20
        
    }

//   @_silgen_name("sum") func swift_sum(a:Int ,b:Int) -> Int {
//
//        return a + b
//    }

//    func add(_ a:Int) ->(Int) -> Int{{ $0 + a }}
  
}

