//
//  main.swift
//  SwiftBaseGrammar
//
//  Created by 赖永鹏 on 2019/8/22.
//  Copyright © 2019年 LYP. All rights reserved.
//

/*
 1. 运算符重载： 类、结构体、枚举可以为现有的运算符提供自定义 的实现
 */

import Foundation
struct Point {
    var x:Int
    var y: Int
    static func + (p1:Point, p2: Point) -> Point{
        return Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
    static func - (p1: Point, p2: Point) -> Point{
        return Point(x: p1.x - p2.x, y: p1.y - p2.y)
    }
//    前缀，表示正负
    static prefix func - (p: Point) -> Point{
        return Point(x: -p.x, y: -p.y)
    }
    
    static func += (p1: inout Point,p2: Point) -> Point{
        p1 = p1 + p2
        return p1
    }
    static prefix func ++(p1: inout Point) -> Point{
        
        p1 += Point(x: 1, y: 1)
        return p1
    }
    static postfix func ++(p1: inout Point) -> Point{
        let tmp  = p1
        p1 += Point(x: 1, y: 1)
        return tmp
    }
    static func ==(p1: Point,p2: Point) -> Bool{
        
        return (p1.x == p2.x) && (p1.y == p2.y)
    }
    
}
/*
 两个实例是否等价，一般准守Equatable协议，重载==运算符
 判断两个实例地址是否相等用 ===
 */
struct Person: Equatable {
    var x: Int
    var y: Int
}

//func + (p1: Point,p2:Point) -> Point{
//   return Point(x: p1.x + p2.x, y: p1.y + p2.y)
//}

let p = Point(x: 15, y: 20) + Point(x: 15, y: 5)
let p1 = Point(x: 15, y: 20) - Point(x: 15, y: 5)
let p2 = -Point(x: 15, y: 20)
var p3 = Point(x: 15, y: 20)
//p3 += p2
//++p3
p3++
let isEqaul = p1 == p2
//print(p,p2,p3,isEqaul)

let pers = Person(x: 1, y: 2)
let pers2 = Person(x: 1, y: 2)
//print(pers == pers2)

/*
 1. 比较两个实例的大小
    1.1 准守Comparable 协议
    1.2 重写相应的运算符
 **/


struct Student:Comparable {
    
    var age: Double
    var score: Double
    init(a: Double, s: Double) {
        self.age = a
        self.score = s
    }
    
    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.age < rhs.age
    }
    static func > (lhs: Student, rhs: Student) -> Bool {
        return lhs.age > rhs.age
    }
    static func >= (lhs: Student, rhs: Student) -> Bool {
        return !(lhs < rhs)
    }
    
    static func <= (lhs: Student, rhs: Student) -> Bool {
        return !(lhs > rhs)
    }
    
}
var stu1 = Student(a: 100, s: 90)
var stu2 = Student(a: 90, s: 100)
var stu3 = Student(a: 100, s: 100)
//print(stu1 > stu2)
//print(stu1 < stu2)
//print(stu1 >= stu3)
//print(stu1 <= stu3)


func test(){
//    TODO:未完成
}
func test2(){
    //FIXME: 有待修复
}


#if TEST
print("test")
#endif

#if OTHER
print("other")
#endif

func YPLog<T>(_ msg:T,
            file:NSString = #file,
            line:Int = #line,
            fn:String = #function) {
    
    #if DEBUG
    let prefix = "\(file.lastPathComponent)_\(line)_\(fn):"
    print(prefix,msg)
    #endif
    
}

YPLog("yptest")
