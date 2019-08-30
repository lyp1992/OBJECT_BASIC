import UIKit

func reverse(_ x: Int) -> Int {
    
    var x = x
    var y = 0
    var symbol = 1
    if x < 0 {
        symbol = -1
    }
    x = x * symbol
    while (x != 0){
        y = y * 10 + x%10
        x /= 10
    }
    
    return y * symbol
}

print(reverse(-1534236469))


/*
 1. 逃逸闭包： 不在函数作用域内执行
 2. 非逃逸闭包: 在函数作用域内执行
 **/

typealias Fn = () -> ()
func other1(_ fn: Fn){ //
    fn()
}
func other2(_ fn: @escaping Fn){
    fn()
}
//func test(value:inout Int) -> Fn{
//    other1 {
//        value += 1
//    }
//
////    逃逸闭包不能改变inout数据
////    other2 {
////        value += 1
////    }
////    func plus(){
////        value += 1
////    }
////    return plus
//}

func balance(_ x: inout Int,_ y: inout Int) {
    let sum = x + y
    x = sum/2
    y = sum - x
}
var num3 = 20
var num4 = 10
balance(&num3, &num4)
