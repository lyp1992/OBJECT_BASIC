//
//  Car.swift
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/27.
//  Copyright © 2019年 LYP. All rights reserved.
//

/*
 使用@objc 修饰swift暴露给oc的属性，使用@objcMembers s修饰类
 利用@objc重命名，暴露给oc的（属性、类、函数名）
 */

/*
 selector 选择器，swift中依然可以用selector，但是只有被@objcmemers或者@objc才有这个功能
 */

import UIKit
@objc(YPCar)
@objcMembers class Car: NSObject {
    
    var price:Double = 0
    @objc(name)
    var master: String = "lyp"
    
    init(price: Double,master: String) {
        
        self.price = price
        self.master = master
        
    }
    @objc(drive)
    func run() {
        print(price,master, "car go go go !")
        perform(#selector(test1))
        perform(#selector(test2), with: nil, afterDelay: 1.0)
        perform(#selector(test3(v1:v2:)))
        perform(#selector(test3(_:_:)))
        perform(#selector(test4(_:_:)))
    }
    
    func test1(){
        print("test1")
    }
    func test2(){
        print("test2")
    }
    func test3(v1: Int,v2: Int)
    {
        print("v1 = \(v1) v2 =\(v2)")
    }
    func test3(_ v1:Double,_ v2:Double) {
        print("_ v1: _v2:")
    }
    func test4(_ v1:Double,_ v2:Double) -> Double{
        print("return double")
        return v1 + v2
    }
    
    
    static func run(){
//      这里不能用perform，容易报找不到方法的错误
//        perform(#selector(test3 as (Double,Double) -> Void)) //
    }
}

extension Car{
//    @objc(exec:v2:) //这个函数u如果不传参数，在swift5.0以下会报错
    func test() {
        print(price,master,"ready go !")
    }
}

@objc protocol Runable{
    func  run1()
    func run2()
    @objc optional func run3() // 可选协议
}

@objcMembers class Dog:NSObject, Runable {
    func run1() {
        print("dog Run1")
    }
    
    func run2() {
        print("dog Run2")
    }
    
    @objc dynamic func test1(){
        print("dog test1")
    }

    func test(){
        print("dog test2")
    }
    
}


