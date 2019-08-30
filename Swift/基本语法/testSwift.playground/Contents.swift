import UIKit

// fallthrough 可以实现switch的贯串效果
var number = 1
switch number {
case 1:
    print(number)
    fallthrough
case 2:
    print(2)
default:
    print(0)
}

/*
 1. 如果确定了类型，可以省略默认的default
 **/
enum Answer{case right,wrong}
let answer = Answer.wrong
switch answer {
case Answer.right:
    print("right")
case Answer.wrong:
    print("wrong")
}

/*
 支持character 和string类型
 */
let string = "jack"
switch string {
case "jack":
    print("jack")
case "joe":
    print("joe")
default:
    break
}
let character: Character = "a"

switch character {
case "a","A":
    print("character is A")
case "b","B":
    print("character is B")
default:
    break
}

/*
 区间匹配
 **/
let number1 = 86
switch number1 {
case 0...59:
    print("不及格")
case 60...79:
    print("良好")
case 80...99:
    print("优秀")
case 100:
    print("满分")
default:
    print("天才")
}
/*
 元组匹配
 **/
let numTuple = (1,2)
switch numTuple {
case (0,0):
    print("this is origin")
case (0,_):
    print("this is y-axis")
case(_,0):
    print("this is x-axis")
case (-2...2,-2...2):
    print("this is inbox")
default:
    print("out box")
}

/*
 值绑定
 **/
let bindingNum = (1,0)
switch bindingNum {
case (let x, 0):
    print("x-axis and value is \(x)")
case (0,let y):
    print("y-axis and value is \(y)")
default:
    break
}

/*
 巧用where
 **/
let point = (1,-1)
switch point {
case let(x,y) where x == y:
    print("on the line \(x) == \(y) ")
case let (x,y) where x == -y:
    print("on the -line \(x) == \(-y) ")
case let(x,y):
    print("\(x),\(y)")
}

let numbers = [1,2,3,4,5,6,7]
var sum = 0
for num in numbers where num > 2{
    sum += num
}
print(sum)

/*
 标签语句
 **/
outer: for i in 0...4{
    for k in 0...4{
        if k == 3 {
            continue outer
        }
        if i == 3 {
            break outer
        }
//        print("i == \(i),k == \(k)")
    }
}

/*
 函数定义
 **/

func pi() -> Double {
    return 3.14
}
// 形参只能是let 类型
func sum1(v1:Int ,v2: Int) -> Int {
    return v1 + v2
}
sum1(v1: 10, v2: 20)

/*
 无参，无返回值
 **/
func printLog() ->(){
    print("log")
}
func printLof() -> Void{
    print("log")
}
func printLoh(){
    print("log")
}

/*
 隐藏返回 在swift5中可以隐藏return
 **/
func sum2(v1: Int,v2:Int) -> Int{
    return v1 + v2
}
print(sum2(v1: 3, v2: 2))

/*
 返回元组，实现多返回
 **/

/// 返回元组
///
/// - Parameters:
///   - v1: 第一个v1参数
///   - v2: 第二个v2参数
/// - Returns: 返回元组
func calculate(v1:Int,v2:Int) -> (sum3:Int,mutiply:Int,division:Int){
    
    return (v2 + v1,v2 * v1, v2/v1)
}
let result = calculate(v1: 10, v2: 20)
print("sum =\(result.sum3) , mutiply=\(result.mutiply), division=\(result.division)")


/// 参数标签，基于语义，提高程序的可读性
///
/// - Parameter time: 具体时间
func gotoWork(at time:String){
    print("this is time at \(time)")
}
gotoWork(at: "08:00")


/// 参数标签省略 可以用_省略参数标签
///
func sum4(_ v1:Int,_ v2:Int) ->Int{
    return v2 + v1
}
print("sum4 = \(sum4(10, 30))");

/*
 参数可以有默认值
 **/
func check(name:String = "jack",age:Int = 10,job:String = "doctor"){
    print("name = \(name) age =\(age) job =\(job)")
}
check(name: "lyp", age: 27, job: "software engineer" )
check(age: 20, job: "no job")
check(name: "rose", job: "luoli")

/*
 以下两个函数构成了函数的重载
 函数重载：
 函数名相同：参数个数，参数类型，参数标签不同都可以构成重载。但是函数返回值不构成重载
 **/
/*
 可变参数 个数
 **/
func sum5(numbers: Int... ) ->Int{
    var total = 0
    for number in numbers {
        total += number
    }
    print("total = \(total)")
    return total
}
sum5(numbers: 1,2,3,4)

/*
 1.一个函数只能有一个可变参数
 2.紧跟可变参数后面的参数，不能省略参数标签
 **/
func sum5(_ numbers:Int...,job:String = "softwareEngineer",_ age:Int = 10) -> Int{
    var total = 0
    for number in numbers {
        total += number
    }
    print("total = \(total) job = \(job) age = \(age)")
    return total
}
sum5(3,4,5,6, job: "teacher",20)

print(1,2,3,4,5, separator: "_", terminator: "***")
print("rose")
print(4,5,6, separator: "_", terminator: "")

/*
 输入输出参数
 可以用inout 定义一个输入输出函数，在函数内部修改外部参数的值
 **/
func modifyParameter(v1 : inout Int,v2 :inout Int ){
    print("v1 = \(v1) v2 =\(v2)")
    
    v1 += v1
    v2 += v2
    print("v1 = \(v1) v2 =\(v2)")
}
var v1 = 0, v2 = 10
modifyParameter(v1: &v1, v2: &v2)

func swapValues(v1 :inout Int,v2: inout Int){
    (v2,v1) = (v1,v2)
   print("v1 = \(v1) v2 =\(v2)")
}
swapValues(v1: &v1, v2: &v2)

/*
 函数类型作为参数返回
 **/
func printResult(_ mathFunc:(Int,Int) -> Int,val1: Int,val2: Int){
    print("macth = \(mathFunc(val1,val2))")
}
printResult(sum1, val1: 1, val2: 2)

/*
 函数类型作为函数返回值
 **/

func next(val: Int) -> Int{
    return val + 1
}
func previous(val: Int) -> Int{
    return val - 1
}

func forward(_ forward: Bool) ->(Int) -> Int{
    return forward ? next:previous
}
forward(true)(3)
forward(false)(5)

/*
 函数嵌套
 **/
func forward(forward: Bool) ->(Int) -> Int{
    func next(val: Int) -> Int{
        print("++++")
        return val + 1
    }
    func previous(val: Int) -> Int{
        print("++++")
        return val - 1
    }
    return forward ? next:previous
}
forward(forward: true)(6)
forward(forward: false)(7)
/*
 typealias 给类型取别名
 **/
typealias Date = (year: Int,month: Int,day: Int)
func test(_ date: Date){
    print("\(date.day) + \(date.month) + \(date.year)")
}
test((2019,08,01))

//枚举
enum password{
    case number(Int,Int,Int,Int) // 32字节
    case other // 1字节
}
MemoryLayout<password>.stride //40 字节
MemoryLayout<password>.size // 33字节

enum season{
    case spring
    case summer
    case autumn
    case winter
}
MemoryLayout<season>.stride // 一个字节

// 可选类型
//while 循环中使用可选类型绑定,遇到非正数或者负数就会跳出循环
var nums = ["10","20","30","abd","-40"]
var sum2 = 0
var index = 0
while let num5 = Int(nums[index]) {
    sum2 += num5
    index += 1
}
print("sum2 = \(sum2)")

// 空合运算符 ??
/*
 a ?? b
 1. a 是可选项
 2. b 是可选项或者是 不可选项
 如果a 不为nil 则返回 a
 如果a 为nil，则返回b
 如果b 为不可选项，返回a的时候会自动解包
 **/

//let a :Int? = 1
//let b: Int? = 2
//let c = a ?? b
//print("c = \(c)") // c 是Int? optional(1)

//let a :Int? = 1
//let b: Int = 2
//let c = a ?? b // c 是Int 1 ： 如果b为不可选，返回a时会自动解包
//print("c = \(c)")

//let a :Int? = nil
//let b: Int = 2
//let c = a ?? b // c 是Int 2 ： 如果b为不可选，返回a时会自动解包
//print("c = \(c)")

let a :Int? = nil
let b: Int? = 2
let y = a ?? b // c 是Int? 2 optional(2)
print("y = \(y)")
// 消除警告的方法

//?? 跟if let 配合使用
if let c = a ?? b{ // 类似于 a != nil || b != nil
    print("c = \(c)")
}
if let c = a, let d = b {
    print("c = \(c)")
    print("d = \(d)")
}
// guard

func login(_ info: [String: String]) -> Bool{
    guard let userName = info["userName"] else {
        print("请输入名字")
        return false
    }
    guard let password = info["password"] else {
        print("请输入密码")
        return false
    }
    print("username = \(userName) password = \(password)")
    return true
}

//login(["userName":"lyp"])
//login(["password":"1235"])
//login(["password":"1235","userName":"lyp"])

// 类和结构体
/*
 区别：1. 指定了初始化值，struct 默认会生成初始化构造器，class也会。
    2. 没有指定初始化h值，class会报错Class 'XXX' has no initializers 。struct 会自动生成一个 初始化值为0的构造函数
 本质区别：struct是值类型，class是指针类型。
 **/
struct Point{
//    var x: Int
//    var y: Int
    var x: Int = 0
    var y: Int = 0
//    结构体默认s会生成初始化构造器，
}
//let tmpPoint = Point(x: 0, y: 0)
let tmpPoint = Point(x: 10, y: 10)

class clsPoint{
    var x: Int
    var y: Int
//    init() {
//       self.x = 0
//        self.y = 0
//    }
    init(_ X:Int,_ Y:Int) {
        self.x = X
        self.y = Y
    }
}
let tmpClsP = clsPoint(0, 0)

// 闭包
/*
 {
 (参数列表) -> 返回值 in{
    函数体代码
 }
 }
 **/
//func tmpTest(_ x: Int,_ y: Int) -> Int{
//    return x + y
//}
//func tmpTest(_ x: Int,_ y: Int) -> Int{x + y}
var fn = {
    (x: Int,y: Int) -> Int in
    return x + y
}
fn(10,20)

// 闭包表达式简写
func exec(x: Int,y: Int,fn1:(Int,Int) -> Int){
    print(fn1(x,y))
}
exec(x: 20, y: 20) { (x, y) -> Int in
   x + y
}
exec(x: 20, y: 20, fn1: {$0 + $1})
exec(x: 20, y: 20, fn1: {
    x,y in x + y
})
exec(x: 20, y: 20, fn1: +)

// 尾随闭包：闭包表达式作为函数的最后一个参数。当闭包表达式作为函数的唯一参数时，可以省略括号
// 排序函数
//func sort(by areInIncreasingOrder:(Element,Element) -> Bool){
//
//}

// 返回的是 从大到小
func cmp(x: Int,y:Int) -> Bool{
    return x > y
}

var numbers1 = [1,3,2,5,4,6,0]
//numbers1.sorted(by: cmp)
//numbers1.sorted { (x, y) -> Bool in
//    x > y
//}
//numbers1.sort(){$0 > $1}
//numbers1.sort{$0 > $1}

//print(numbers1)

/*
 闭包：一个函数和他捕获的变量/常量环境组合起来
 定义在函数内部的函数
 捕获外层函数的常量/变量
 
// 可以看做是类的实例对象
 内存在堆空间
 捕获的变量是存储属性
 组成闭包的函数就是n类内部的方法
 **/
typealias Fn = (Int) -> Int
func getFn() -> Fn{
    var nump = 0
    func getFunc(_ i:Int) -> Int{
        nump += i
        return nump
    }
    return getFunc
}

var fnp = getFn()
fnp(1)
fnp(2)
fnp(3)

// 自动闭包
func getFirstPositive(_ v1: Int, _ v2: () -> Int) -> Int{
    return v1 > 0 ? v1:v2()
}
// @autoclosure 构成函数重载，他有函数执行延迟
func getFirstPositive(_ v1: Int, _ v2: @autoclosure() -> Int) -> Int{
    return v1 > 0 ? v1:v2()
}

//getFirstPositive(-10) { () -> Int in
//    20
//}

//getFirstPositive(-10, {20})
getFirstPositive(-10, 20) // 会自动生成{20}


// 属性：存储属性，计算属性
struct circle{
    var radius: Double
    var diameter: Double{
        set(NewDiameter){
            radius = NewDiameter/2
        }
        get{
           return radius * 2
        }
    }
}
// 计算属性不占用实例的内存，相当于实例内部的方法。枚举中的rawValue其实就是只读的计算属性
var cir = circle(radius: 2)
print(cir.diameter)
cir.diameter = 20
print(cir.radius)

// 延迟存储属性
class Car{
    init() {
        print("car -- init")
    }
    func run() {
        print("car run")
    }
}
class Person {
    var car = Car()
   required init() {
        print("person -- init")
    }
    func getOut() {
        car.run()
    }
    func study(){
        print("person study")
    }
}
var person = Person()
//person.getOut()

// 延迟属性的注意点：当结构体中有延迟属性的时候，只有var才能访问延迟属性，因为范访问延迟属性会改变内存结构
struct Point1{
    var x: Int = 0
    var y: Int = 0
    lazy var z: Int = 1
}
//let p1 = Point1(x: 1, y: 2, z: 3)
//print(p1.z)

// 可以为非lazy属性添加属性观察器
struct circleDis{
    var radius:Double{
        willSet{
            print("radius willchange",newValue)
        }
        didSet{
            print("radius didChange",oldValue,radius)
        }
    }
    init() {
        self.radius = 1
        print("circle -- Init")
    }
}
var circleD = circleDis()
circleD.radius = 10

// 单例
public class PersonInstance{
    public static let shared = PersonInstance()
    
    private init(){
        print("person Instance")
    }
}
var pi1 = PersonInstance.shared
var pi2 = PersonInstance.shared

//mutating ,结构体和枚举都是值类型，默认情况下，实例方法是不能修改属性值的。所以需要加上mutating
struct PersonLyp{
    var age = 10
    var height = 180
   mutating func eat(a: Int,h: Int){
        age = a
        height = h
    }
//    加上@discardableResult 可以消除返回值没有被使用的警告
 @discardableResult mutating func runEat(h: Int) -> Int {
        height += h
        return height
    }
}

var plyp = PersonLyp()
plyp.eat(a: 20, h: 200)
plyp.runEat(h: 130)

// 下标 subscript 可以给任意类型添加下标
/*
 下标可以没有set方法，但是必须要有get方法
 如果下标只有get方法，可以省略get
 **/
class PointNew{
    var x: Int = 0, y: Int = 0
//    subscript(index: Int) -> Int{
//        set{
//            if index == 0{
//                x = newValue
//            }
//            if index == 1{
//                y = newValue
//            }
//        }
//        get{
//            if index == 0{
//                return x
//            }else if index == 1{
//                return y
//            }
//            return 0
//        }
//    }
    
//    可以设置参数标签
    subscript(index i: Int) -> Int{
        if i == 0{
            return x
        }
        if i == 1{
            return y
        }
        return 0
    }
}
var pN = PointNew()
pN.x = 10
pN.y = 20
//pN[0]
//pN[1]
print( pN[index:1])

// 下标还可以作为类型方法,swift4.0还不能用
//class Sumx{
//   static subscript(v1: Int,v2: Int) -> Int{
//        return v1 + v2
//    }
//}
//Sumx[v1:10,v2:10]

// 继承
//class Animal{
//    var age: Int = 0
//}
//class Dog: Animal {
//    var name: String = "laowang"
//}
//class ErHa: Dog {
//    var height: Double = 12.0
//}
//let animal1 = Animal()
//MemoryLayout<Animal>.size
//MemoryLayout<Animal>.stride
//MemoryLayout<ErHa>.size
//MemoryLayout<Dog>.stride

/*
继承：重写父类的方法，下标

 重写属性
 1. 子类可以重写父类属性
    1.1 只能重写var，不能重写let
    1.2 只能重写为计算属性，不能为存储属性
    1.3 子类重写的属性权限不能小于父类。比如，父类是只读，那么子类应该可读可写。
 2. 类型属性/方法
    2.1 被class修饰的类型属性/方法可以被重写
    2.2 被static修饰的类型属性/方法不能被重写
 3. 可以为父类添加属性监听器
 
 4. 被final修饰的属性不能被重写，被final修饰的类不能被继承
 */
class Animal{
    func speak(){
        print("animal speak")
    }
    subscript(index: Int) -> Int{
        return index
    }
    var age: Int = 0
    
    var weight: Double = 100.0
}
class Dog: Animal {
    override func speak() {
        super.speak()
        print("dog speak")
    }
    
    override subscript(index: Int) -> Int{
        return super[index] + 1
    }
    override var age: Int{
        set{
            super.age = newValue
        }
        get{
           
           return super.age
        }
    }
    override var weight: Double{
        willSet{
            print("newValue \(newValue)")
        }
        didSet{
            print("oldValue \(oldValue) \(weight)")
        }
    }
}
var ani = Animal()
ani.speak()
ani[1]
ani.age = 10
ani.weight = 90

let dog = Dog()
dog.speak()
dog[0]
dog.age = 12
print("ani \(ani.age) dog \(dog.age)")

//ani = Dog()
//ani.speak()
//ani[2]
//ani.weight = 92

// 可选链
class Cary{
    var price:Double = 100
}
class Dogy {
    var price:Double = 30
}
class PersonY {
    var name: String = "deven"
    var dog: Dogy = Dogy()
    var car: Cary? = Cary()
    func age() -> Int {
        return 18
    }
    subscript(index: Int) -> Int{
        return index
    }
}

var pery: PersonY? = PersonY()
var name = pery!.name
var dogy = pery?.dog
var cary = pery?.car
var agep = pery?.age()
var indexp = pery?[3]
//print("\(name) \(dogy) \(cary) \(agep) \(indexp)")

var dict: [String: (Int,Int) -> Int] = [
    "sum" : (+),
    "difference" : (-)
]

var resulty = dict["sum"]?(10,20)
//print("result= \(String(describing: resulty))")

// 协议中的属性
protocol Drawable{
    func draw()
    var x: Int{get set}
    var y: Int{get}
    subscript(index: Int) ->Int{
        get
        set
    }
}
class PersonL: Drawable {
    subscript(index: Int) -> Int {
        get {
            return index
        }
        set {
            index + 1
        }
    }
    
    func draw() {
        print("person draw")
    }
    var x: Int = 0
    
//   在swift4.0 中这样写好像也没有问题
//    var y: Int = 0
    let y : Int = 0
}
var pl = PersonL()
pl[0]
pl.draw()
pl.x = 1
pl.y

// 枚举准守CaseIterable
enum seasonl: CaseIterable{
    case spring
    case summer
    case autumn
    case winter
}
var seas = seasonl.allCases
for sea in seas{
    print(sea)
}
// X.type
class Student:Person{
//    fatalError 不得不写，但是又不想让别人调的方法
    required init() {
        fatalError("don't call student init")
    }
    init(age: Int) {
        print("student age = \(age)")
    }
    
}
var stu = Student(age: 10)
stu.study()
var personType: Person.Type = Person.self
var stuType: Student.Type = Student.self

//  自定义错误
enum SomeError: Error{
    case illegalArg(String)
    case outOfBounds(Int,Int)
    case outOfMemory
}
// 自定义的error错误，要加上 throws
func divide(num1: Int,num2: Int) throws -> Int{
    if num2 == 0{
        throw SomeError.illegalArg("0 不能作为除数")
    }
    return num1/num2
}
// 如果需要错误

//var res1 = try divide(num1: 10, num2: 0)

// 可以用do catch 捕捉错误
func test(){
    do {
       print(try divide(num1: 20, num2: 0))
    } catch let SomeError.illegalArg(msg){
        print("参数异常：\(msg)")
    }catch let SomeError.outOfBounds(size, index){
        print("下标越界：size =\(size) index = \(index)")
    }catch SomeError.outOfMemory{
        print("内存溢出")
    }catch{
        print("其他问题")
    }
}
test()

/*
处理error的两种方式
 1. 通过do catch
 2. 不捕捉error，抛给上层函数
 */
func test2() throws {
    print("1")
    print(try divide(num1: 20, num2: 0))
}
// 如果上层函数也不对error进行处理，那么退出程序
//try test2()

// rethorws 表示函数本身不会抛出错误，但是闭包内的函数会
func exec(fn:(Int, Int) throws -> Int, num1: Int,num2: Int) rethrows{
   print(try fn(num1,num2))
}

//try exec(fn:divide, num1: 20, num2: 0)

// 泛型 可以将参数类型化，提高代码复用率，减少代码量

func swapValues<T>(num1: inout T,num2: inout T){
    (num1,num2) = (num2,num1)
}
var a1 = 20
var b1 = 10
swapValues(num1: &a1, num2: &b1)
print("a = \(a1) b = \(b1)")

struct Date1 {var year = 0,month = 0,day = 0 }

var d1 = Date1(year: 2019, month: 6, day: 19)
var d2 = Date1(year: 2017, month: 8, day: 10)
swapValues(num1: &d1, num2: &d2)
print("d1 = \(d1) d2 = \(d2)")

// 创建一个栈
class Stack<E>{
    var elements = [E]()
    func push(_ element:E) {
        elements.append(element)
    }
    func top() -> E {
        return elements.last!
    }
    func size() -> Int {
        return elements.count
    }
    func pop() {
        elements.removeLast()
    }
}

/*
 字面量：
 1.1 字面量协议
 */
extension Int: ExpressibleByBooleanLiteral{

    public init(booleanLiteral value: Bool){
        self = value ? 1 : 0
    }
}

var num: Int = true
//print(num)

class StudentYP: ExpressibleByIntegerLiteral,ExpressibleByFloatLiteral{
    var score: Double = 0
    var name:String = ""
    required init(floatLiteral value: Double) {
        self.score = value
    }
    required init(integerLiteral value: Int) {
        self.score = Double(value)
    }
}
//let stuYp = StudentYP(floatLiteral: 90)
//stuYp.name = "lyp"
//print(stuYp.score)
var stuYp : StudentYP = 90
print(stuYp.score,stuYp.name)

struct PointYP{
    var x: Double = 0
    var y: Double = 0
}
extension PointYP: ExpressibleByArrayLiteral,ExpressibleByDictionaryLiteral{
    
    init(arrayLiteral elements: Double...) {
        guard elements.count > 0 else {
            return
        }
        self.x = elements[0]
        guard elements.count > 1 else{
            return
        }
        self.y = elements[1]
    }
    
    init(dictionaryLiteral elements: (String, Double)...) {
        for (key,value) in elements {
            if key == "x" {
                self.x = value
            }
            if key == "y" {
                self.y = value
            }
        }
    }
    
}
var pointYp:PointYP = [10.5,20.1]
//print(pointYp)
var pointYp2: PointYP = ["x":10.5,"y":20.5]
//print(pointYp2)


/*
 API 的可用性
 */
struct StudentP{
    @available(*,unavailable,renamed: "study")
    func study_() {
        print("study_")
    }
    func study(){
        print("study")
    }
    
    @available(iOS,deprecated: 11.0)
    @available(macOS,deprecated: 10.12)
    func run() {
        print("run")
    }
}

let stuP = StudentP()
stuP.study()



var yPStr: String = "1"
yPStr.append("2")
yPStr = yPStr + "_3"

