//
//  List.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class ListNode{
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List: NSObject {

    var head: ListNode?
    var tail: ListNode?
    
//    尾插法，和输入的顺序一致，每次都往最后插入
    func appendTail(_ val: Int) {
        if tail == nil {// 设置头结点
            tail = ListNode(val)
            head = tail
        }else{// 设置next的指向
            tail!.next = ListNode(val)
            tail = tail!.next // 将w最后一个节点设置成尾节点
        }
    }
    
    //    头插法: 和输入顺序相反，每次都往第一个元素的前面插入
    func appendHead(_ val: Int) {
        if head == nil{
            head = ListNode(val)
            tail = head
        }else{
            let tmp = ListNode(val)
            tmp.next = head
            head = tmp
        }
    }
    
//    打印链表
    func printList(_ head: ListNode?){
        var node = head
        if node != nil {
            
            while node != nil{
                print("->" + String(node!.val))
                node = node!.next
            }
        }else{
            print("Not Vaild Data")
        }
    }
    
}
