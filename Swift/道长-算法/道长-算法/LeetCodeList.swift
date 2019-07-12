//
//  LeetCodeList.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/6/10.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class LeetCodeList: NSObject {
        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            
            var listN1 = l1
            var listN2 = l2
            let dummy = ListNode(Int.min)
            var currentNode :ListNode? = dummy
            
            while listN1 != nil && listN2 != nil {
                if listN1!.val < listN2!.val{
                    currentNode?.next = listN1
                    listN1 = listN1!.next
                }else{
                    currentNode?.next = listN2
                    listN2 = listN2!.next
                }
                currentNode = currentNode!.next
            }
            
            if listN1 != nil{
                currentNode?.next = listN1
            }
            if listN2 != nil{
                currentNode?.next = listN2
            }
            
            return dummy.next
        }
    
//    排序K个链表
//    方法有三种L：第一种，暴力按次序合并，
//    第二种：遍历k个链表，取出所有的元素放进数组中，然后在对数组进行排序，之后在连接成链表。时间复杂度是 k*n(logk*n)
//    第三种：分治。第一次合并k/2 每次处理2*n个数字，第二轮合并k/4 每次处理4*n个数字。。最后处理k*（2logk）次

    
    
    //    Linked List Cycle 求环的的起点:
//    1. 遍历链表中的元素，存入数组中，数组中第一个重复的元素就是环的起点
//    2. 快慢指针，先找到meet的那个点，然后以让head 和meet一起走，相遇的那个点就是环的起点。假设AB快慢指针 A行走的路程是 a + b  B行走的路径应该是a+b+c+b 可以得出a = c
    
    func findCycleStart(_ head:ListNode?) -> ListNode?{
        var head = head
        var tmpHead = head;
        var meet:ListNode?
        while head != nil{
            guard let slow = head?.next else{
                return nil
            }
            guard let fast = head?.next?.next else{
//                没有环
                return nil
            }
            
            if slow.val == fast.val{
                meet = fast
            }
           head = head?.next
        }
        while tmpHead != nil && meet != nil{
            while tmpHead?.val == meet?.val{
                return meet;
            }
            tmpHead = tmpHead?.next
            meet = meet?.next
        }
        return nil
    }
    
    
}
