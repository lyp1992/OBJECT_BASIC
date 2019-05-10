//
//  StackProtocol.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/17.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Foundation
protocol Stack {
    /// 持有的元素类型
    associatedtype Element
    
    /// 是否为空
    var isEmpty: Bool { get }
    /// 栈的大小
    var size: Int { get }
    /// 栈顶元素
    var peek: Element? { get }
    
    /// 进栈
    mutating func push(_ newElement: Element)
    /// 出栈
    mutating func pop() -> Element?
}

struct IntegerStack: Stack {
    typealias Element = Int
    
    var isEmpty: Bool { return stack.isEmpty }
    var size: Int { return stack.count }
    var peek: Element? { return stack.last }
    
    private var stack = [Element]()
    
    mutating func push(_ newElement: Element) {
//        0，1，2，3，4
        stack.append(newElement)
    }
    
    mutating func pop() -> Element? {
//        先进后出
        return stack.popLast()
    }
}

// 用栈实现队列  栈是先进后出，队列是先进先出

struct MyQueue {
    
    var stackA: IntegerStack
    var stackB: IntegerStack
    
    var isEmpty: Bool {
        return stackA.isEmpty && stackB.isEmpty;
    }
    
    var peek: Any? {
        mutating get {
            shift();
            return stackB.peek;
        }
    }
    
    var size: Int {
        get {
            return stackA.size + stackB.size
        }
    }
    
    init() {
        stackA = IntegerStack()
        stackB = IntegerStack()
    }
    
    mutating func enqueue(object: Any) {
        stackA.push(object as! IntegerStack.Element);
    }
    
    mutating func dequeue() -> Any? {
        shift()
        return stackB.pop();
    }
//    自动填充的
    fileprivate mutating func shift() {
        if stackB.isEmpty {
            while !stackA.isEmpty {
                stackB.push(stackA.pop()!);
            }
        }
    }
    
}

