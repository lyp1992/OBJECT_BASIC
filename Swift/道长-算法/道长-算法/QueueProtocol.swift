//
//  QueueProtocol.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/17.
//  Copyright © 2019年 LYP. All rights reserved.
//
// 用两个数组显示队列的先进先出原则，将第一个数组的元素d全部导入第二个数组中，然后将第二个数组
import Foundation
protocol Queue {
    /// 持有的元素类型
    associatedtype Element
    
    /// 是否为空
    var isEmpty: Bool { get }
    /// 栈的大小
    var size: Int { get }
    /// 栈顶元素
    var peek: Element? { get }
    
    /// 入队
    mutating func enqueue(_ newElement: Element)
    /// 出队
    mutating func dequeue() -> Element?
}

struct IntegerQueue: Queue {
    typealias Element = Int
    
    var isEmpty: Bool {return left.isEmpty && right.isEmpty}
    var size: Int {return left.count + right.count}
    var peek: Element? {return left.isEmpty ? right.first : left.last}
    
    private var left = [Element]()
    private var right = [Element]()
    
    mutating func enqueue(_ newElement: Int) {
//        0，1，2，3，4
        right.append(newElement)
    }
    mutating func dequeue() -> Element? {
        if left.isEmpty {
//            4，3，2，1，0
            left = right.reversed()
            right.removeAll()
        }
        return left.popLast()
    }
    
}

// 用队列实现栈 思路，用队列1和队列2 将队列是先进先出，要取队列栈顶的元素，就需要将栈顶之外的四个元素先出栈，然后拿到。利用这点，将queue1 和queue2 来回倒腾，每次都将栈顶元素出栈，而不入队，就实现了栈的后进先出
struct MyStack {
    
    var queueA : IntegerQueue
    var queueB : IntegerQueue
    
    init() {
        queueA = IntegerQueue()
        queueB = IntegerQueue()
    }
    /// 是否为空
    var isEmpty: Bool { return queueB.isEmpty && queueA.isEmpty }
    /// 栈的大小
    var size: Int { return queueA.size }
    /// 栈顶元素
    var peek: Any? {
        mutating get{
            shift()
            let peekObj = queueA.peek
            queueB.enqueue(queueA.dequeue()!)
            swap()
            return peekObj
        }
    }
    
    /// 入栈
    mutating func enqueue(object:Any){
        queueA.enqueue(object as! Int)
    }
    /// 出栈
    mutating func dequeue() -> Any?{
        shift()
        let popObj = queueA.dequeue()
        swap()
        return popObj
    }
    private mutating func shift(){
        while queueA.size != 1 {
            queueB.enqueue(queueB.dequeue()!)
        }
    }
    
    private mutating func swap(){
        (queueB,queueA) = (queueA,queueB)
    }
    
}
