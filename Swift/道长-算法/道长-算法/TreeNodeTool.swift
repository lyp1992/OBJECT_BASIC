//
//  TreeNodeTool.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/18.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

public class TreeNode{
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
    }
    
}

class TreeNodeTool: NSObject {

// 创建二叉查找树，小于根节点放在左边，大于根节点放在右边
    func creatTree(_ values: [Int]) -> TreeNode? {
        var root: TreeNode?
        for i in 0..<values.count {
           root = addTreeNode(root, values[i])
        }
        return root
    }
    
//    往树中添加元素
    func addTreeNode(_ treeNode: TreeNode?,_ value: Int) -> TreeNode? {
        let treeNode = treeNode
        if treeNode == nil {
            let treeNode = TreeNode(0)
            treeNode.val = value
//            print("node: \(value)")
        }else if(value < treeNode!.val){
//            print("to: left")
            treeNode?.left = addTreeNode(treeNode?.left, value)
        }else if (value >= treeNode!.val){
//             print("to: right")
            treeNode?.right = addTreeNode(treeNode?.right, value)
        }
        return treeNode
    }
    
//    输出深度
    func treeNodeDepth(_ treeNode: TreeNode?) -> Int {
        guard let treeNode = treeNode else{
            return 0
        }
        return max(treeNodeDepth(treeNode.left), treeNodeDepth(treeNode.right)) + 1
    }
    
//    判断一个树是否是二叉查找树
    func isVaildBST(treeNode: TreeNode?) -> Bool {
      return _hleper(treeNode, nil, nil)
    }
    func _hleper(_ treeNode: TreeNode?,_ min: Int?,_ max: Int?) -> Bool {
        guard let treeNode = treeNode else{
            return true
        }
//        所有的右节点必须大于父节点
        if let min = min, treeNode.val <= min {
            return false
        }
//        所有的左节点必须小于根节点
        if let max = max , treeNode.val >= max{
            return false
        }
        return _hleper(treeNode.left,min,treeNode.val) && _hleper(treeNode.right,treeNode.val,max)
    }
    
//    打印二叉树，前序遍历，中序遍历，后序遍历
    func preOrderTraversal(_ treeNode: TreeNode?) -> [Int] {
//        用栈实现前序遍历
        var res = [Int]()
        var stack = [TreeNode]()
        var node = treeNode
        
        while !stack.isEmpty || node != nil {
            if node != nil{
                res.append(node!.val)
                stack.append(node!)
                node = node!.left
            }else{
//                打印完了左边，打印右边
                node = stack.removeLast().right
            }
        }
        return res
    }
    
    func preOrderTraversal2(_ treeNode: TreeNode?) -> [Int] {
        guard let root = treeNode else {
            return []
        }
        //        用栈实现前序遍历
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        while !stack.isEmpty {
            let node = stack.removeLast()
            res.append(node.val)
            if let left = node.left{
                stack.append(left)
            }
            if let right = node.right{
                stack.append(right)
            }
        }
        return res
    }
    
//    层级遍历
    func levelOrder(_ treeNode: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
//        用数组来实现队列
        var queue = [TreeNode]()
        if let root = treeNode{
            queue.append(root)
        }
        while queue.count > 0 {
            let size = queue.count
            var level = [Int]()
            for _ in 0..<size{
                let node = queue.removeFirst()
                level.append(node.val)
                
                if let left = node.left{
                    queue.append(left)
                }
                if let right = node.right{
                    queue.append(right)
                }
            }
            res.append(level)
        }
        
        return res
    }
    
}
