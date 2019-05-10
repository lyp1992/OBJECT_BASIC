//
//  Dunmy.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

// 算法： 给定一个链表和一个值，要求大于这个值得放在右边，小于这个值得在左边

import Cocoa

class Dunmy: NSObject {

//    将小于x的数放在左边,采用尾插法，遍历链表，将小于X的值重新插入新的链表
    func getLeftList(_ head: ListNode?, _ x: Int) -> ListNode? {
        let dummy = ListNode(0)
        var pre = dummy
        var node = head
        while node!.next != nil {
            if node!.val < x {
                pre.next = node
                pre = node!
            }
            node = node!.next
        }
        node!.next = nil
        return dummy.next
    }
//    改编一下，就可以实现防止到左右两边
    func partition(_ head: ListNode?,_ x: Int) -> ListNode? {
        
        let preDummy = ListNode(0)
        var pre = preDummy
        let postDummy = ListNode(0)
        var post = postDummy
        var node = head
        
        while node != nil {
            if node!.val < x{
                pre.next = node
                pre = node!
            }else{
                post.next = node
                post = node!
            }
            node = node!.next
        }
//        拼接
        post.next = nil
        pre.next = postDummy.next
        
        return preDummy.next
    }
    
//    判断链表是否有环，用快慢指针原理，第二个指针比第一个指针快2倍
    func cycleList(_ head: ListNode?) -> Bool{
        var slow = node
        var falst = node
        
        while falst != nil && falst?.next != nil {
             slow = slow!.next
             falst = falst!.next!.next
            if slow === falst {
                return true
            }
        }
        return false
    }
    
//    删除链表中的第N个元素，两个指针，第一个指针直接指向第n个，当第二个指针走到最后一个元素的时候，第一个指针的下一个就是需要删除的元素，这是只需要把x指针的next指向下下一个就行
    
    func deleteEelments(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
//        使用dummy 的原因是有可能需要删除头结点
        let dummy = ListNode(0)
        dummy.next = head
        var pre: ListNode? = dummy
        var post: ListNode? = dummy
        
        for _ in 0..<n {
            if post == nil{
                break
            }
            post = post!.next
        }
        
//        移动两个节点
        while post!.next != nil && post != nil {
            pre = pre!.next
            post = post!.next
        }
        
//        将pre的指针指向下下个节点
        pre!.next = pre!.next!.next
        
        return dummy.next
    }

    
}
