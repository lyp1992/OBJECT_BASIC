import UIKit

var str = "Hello, playground"

// 如果不想换行
for x in 0..<10{
    print("\(x)", separator: "\\", terminator: "|");
}
print()

let theInput = readLine()

print(theInput);

typealias feet = Int;
var distance: feet = 100;
print(distance);

// 变量可以由字母，数字，下划线构成，自动识别变量类型的能力
var _123 = 23;
print(_123);

// 申明s可选类型
var mystring : String?
var ypString: String?

ypString = "hello,word"
if ypString != nil {
    print(ypString!)
}

for index in 0...5{
    print("\(index) * 5 = \(index * 5)")
}

// 字符串可以添加，删除，
var yxString = "hello"
//yxString += "world"
if yxString.isEmpty{
    print("yxString = \(yxString.appending("word"))")
}else{
    print("\(yxString) + \(yxString.count)")
}


// 字符串插入值
var varA = 20
var constA = 100
var varc:Float = 20.0
var stringA = "\(varA)乘以\(constA)等于\(varc * 100)"
print(stringA)

// 字符串分割
let fullName = "hello world"
//let fullNameArr = fullName.characters.split(separator: " ").map(String.init)
let fullNameArr = fullName.components(separatedBy: " ")

print(fullNameArr[0])

// 字符character，单一，不能为空
for ch in "hello".trimmingCharacters(in: CharacterSet.init()){
    print(ch)
}
for ch in "hello".characters.indices{
    print(ch)
}

//创建数组 someArray = [someType]()
var someArray = [Int](repeating: 0, count: 3)
var someInts:[Int] = [10,20,30]
//访问数组，索引访问
print(someInts[0])
someInts.append(40)
someInts += [50]
print(someInts)

var someStrs = [String]()
someStrs.append("apple")
someStrs.append("hello")
someStrs += ["world"]
for ch in someStrs{
    print(ch)
}
for (index, ch) in someStrs.enumerated() {
    print("\(index) = \(ch)")
}
//合并数组
var intsA = [Int](repeating: 2, count: 2)
var intsB = [Int](repeating: 1, count: 1)
var intsC = intsA + intsB
for item in intsC {
    print(item)
}

print(someStrs.contains("hello"))

//字典 someDic = [keyType: ValueType]()
//var someDict = [Int: String]()
var someDict:[Int: String] = [1:"one",2:"two",3:"three"]

for (key,value) in someDict {
    print("key = \(key) value= \(value)")
}

//print(someDict[1])
//// 修改字典的值
//someDict.updateValue("oneNew", forKey: 1)
//print(someDict)
//someDict.removeValue(forKey: 1)//移除值
//print(someDict[1])
//someDict[2] = nil//直接赋值
//print(someDict[2])

//将字典转成数组
let dictKeys = someDict.keys
let dictValues = someDict.values
for key in dictKeys{
    print("\(key)")
}
for value in dictValues {
    print("\(value)")
}

// swift 函数 语法
//func funcName(形参)->retrunType{
//  statemets1
//    statements2
//    return paraments
//}
func runoob(site: String) -> String {
    return site
}
print(runoob(site: "www.runoob.string"))

//元组类型作为返回值
//eg: 求数组中的最大最小值，并且返回
func minMax(array:[Int]) -> (min: Int,max: Int)? {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin{
            currentMin = value
        }else if (value > currentMax){
            currentMax = value
        }
    }
    return (currentMin,currentMax)
}
let bounds = minMax(array: [8,-8,2,109,3,71])
print("\(String(describing: bounds?.max)) min = \(String(describing: bounds?.min))")

func pow(firstAsg a:Int, secondAsg b:Int) -> Int{
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    print(res)
    return res
}
print(pow(5, 3));

// 传入可变参数
func vari<N>(members:N...){
    for i in members{
        print(i)
    }
}

vari(members: 4,3,5)
vari(members: 2,3,3,4,5)

// I/O 参数
func swapTwoInts(_ a: inout Int,_ b: inout Int){
    let tmp = a
    a = b
    b = tmp
}
var x = 1
var y = 2
swapTwoInts(&x, &y)
print("x = \(x) y=\(y)")

// 将函数作为参数类型，c函数类型作为返回类型
func sum(a: Int, b: Int) -> Int{
    return a + b
}
var addition: (Int,Int) -> Int = sum;
print("输出结果: \(addition(40,89))")

func another(addition:(Int,Int) -> Int, a: Int, b: Int){
    print("输出结果: \(addition(a,b))")
}
another(addition: sum, a: 20, b: 10)

// 函数嵌套 :函数内定义一个新的函数，外部的函数可以调用函数内定义的函数
func calcDec(forDec total: Int) ->() -> Int{
    var tmp = 0
    func dex() -> Int{
        tmp -= total
        return tmp
    }
    return dex
}

let dec = calcDec(forDec: 30)
print(dec())

// 闭包
//{(parameters) -> retrun type in
//    statements
//}

let divide = {(val1: Int,val2: Int) -> Int in
    return val1 / val2
}
let result = divide(200,20)
print(result)

// sorted 方法
let names = ["AT","AE","D","S","BE"]
//使用普通函数（或者内嵌函数）提供排序功能
func backWards(s1: String,s2: String) -> Bool{
    return s1 > s2
}
//var reversed = names.sorted(by: backWards)
//var reversed = names.sorted()//默认是从大到小
//参数名称缩写,$0 和$1 分别代表闭包中的第一个和第二个string类型的参数
//var reversed = names.sorted(by: {$0 > $1})
//运算符函数
//var reversed = names.sorted(by: >)

// 尾随闭包,当使用尾随闭包时，他只需要闭包表达式的一个参数，所以可以
//省略（） names.sorted{$0 > $1}
var reversed = names.sorted(){$0 > $1}

print(reversed)

// 闭包的引用类型,都是指针传递
func testIncrement(addIncrement amount: Int) ->() -> Int{
    
    var totalIncrement = 0
    func addCount() -> Int{
        totalIncrement += amount
        return totalIncrement
    }
    return addCount
}

let increment = testIncrement(addIncrement: 10)

print(increment())
print(increment())
print(increment())

let incrementBtn = increment

print(incrementBtn())

// 定义枚举
enum DaysofaWeek{
    case Sunday
    case Monday
    case TuesDay
}
var weekDay = DaysofaWeek.TuesDay
weekDay = .TuesDay
switch weekDay {
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
default :
    print("星期二")
}

enum Month: Int{
    case January = 1, February,March
}
let yearMonth = Month.March.rawValue
print("数字月份：\(yearMonth)")

//结构体, 可以通过实例化传值并且克隆一个结构体
struct MarksStruct {
    var mark: Int
    
    init(mark: Int) {
        self.mark = mark
    }
}
var aStruct = MarksStruct(mark: 10)
var bStruct = aStruct
print(bStruct.mark)
bStruct.mark = 20
print(bStruct.mark)


var nums1 = [1,3,2]
var nums2 = [4,6,5]
var num = nums1 + nums2

print(num.sorted())

func balance(_ x: inout Int,_ y: inout Int){
    let sum = x + y
    x = 2
    y = sum - x
}

var num3 = 20
var num4 = 10
balance(&num4, &num3)

// 内存冲突： 就是这个函数什么也不干，编译器也不能通过
//balance(&num3, &num3)

