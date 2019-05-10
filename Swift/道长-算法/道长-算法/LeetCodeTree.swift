//
//  LeetCodeTree.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/5/9.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class LeetCodeTree: NSObject {

//    94. Binary Tree Inorder Traversal 前序遍历 [1,null,2,3] -> [1,3,2]
   func inorderTraversal(_ root: TreeNode?) -> [Int] {

    var node = root
//    创建栈
    var queue = [TreeNode]()
    var valArr = [Int]()
    while !queue.isEmpty || node != nil {
        if node != nil{
//            valArr.append(node!.val) // 输出【1，2，3】
            queue.append(node!)
            node = node?.left
        }else{
            node = queue.removeLast()
            valArr.append(node!.val) // 输出【1，3，2】
//            打印右边
            node = node?.right
        }
    }
    return valArr
    }
    
//   450. Delete Node in a BST
    func deleteNodeBST(_ root: TreeNode?, _ key: Int) -> TreeNode?{
        guard let root = root else{
            return nil
        }
        
        if key < root.val{
            root.left = deleteNodeBST(root.left, key)
        }else  if(key > root.val){
            root.right = deleteNodeBST(root.right, key)
        }else{
        
            if root.left == nil{
                return root.right
            }else if root.right == nil{
                return root.left
            }else{
                let minNode = deleteNodeBSTHelper(root.right!)
                root.val = minNode.val
                root.right = deleteNodeBST(root.right, root.val)
            }
            
        }
        return root
    }
    
    func deleteNodeBSTHelper(_ root : TreeNode) -> TreeNode{
        var root = root;
        while let leftNode = root.left {
            root = leftNode
        }
     
        return root
    }
    
//    后序遍历
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {
        
        var node = root
        //    创建栈
        var queue = [TreeNode?]()
        var valArr = [Int]()
        while !queue.isEmpty || node != nil {
            if node != nil{
                queue.append(node!)
                node = node?.left
            }else{
                if let last = queue.last!{
                    queue.append(nil)
                    node = last.right
                }else{
                    queue.popLast()
                    node = queue.popLast()!
                    valArr.append(node!.val)
                    node = nil
                }
            }
        }
        return valArr
    }
    
//    后序遍历
    func postOrderTraversal(_ root : TreeNode?) -> [Int]{
        guard let root = root else {
            return []
        }
        var res = [Int]()
        postOrderTraversal(&res, root)
        return res
    }
    func postOrderTraversal(_ res:inout [Int],_ node: TreeNode?){
        if node == nil{
            return
        }
        
        if node?.left != nil{
            postOrderTraversal(&res, node?.left)
        }
        if node?.right != nil {
            postOrderTraversal(&res, node?.right)
        }
        
        res.append(node!.val)
    }
    
    //    105. Construct Binary Tree from Preorder and Inorder Traversal 给定前序和中序，求二叉树

    func buileTree(_ preNode: [Int],_ inNode: [Int]) -> TreeNode?{
        return buileTreeHelper(0, 0, preNode.count - 1, preNode, inNode)
    }
    //    preorder = [3,9,10,20,15,7]
    //    inorder = [10,9,3,15,20,7]
//    [1,2,3]
//    [2,3,1]
    func buileTreeHelper(_ preStart: Int,_ inStart: Int,_ endStart: Int,_ preNode: [Int],_ inNode: [Int]) -> TreeNode?{
        if preStart > preNode.count - 1 || inStart > endStart{
            return nil
        }
        let root = TreeNode(preNode[preStart])
        var index = 0
        for i in inStart...endStart {
            if inNode[i] == root.val{
                index = i
                break
            }
        }
        root.left = buileTreeHelper(preStart + 1, inStart, index - 1, preNode, inNode)
        root.right = buileTreeHelper(index + 1 + preStart - inStart , index + 1, endStart, preNode, inNode)
        return root
    }
    
//    106. Construct Binary Tree from Inorder and Postorder Traversal
    func buildTree2(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
       return buileTreeHelper2(0,postorder.count - 1,0, inorder.count - 1, inorder, postorder)
    }
    //    inorder = [9,3,15,20,7]
    //    postorder = [9,15,7,20,3]
    func buileTreeHelper2(_ postStart: Int,_ postEnd: Int,_ inStart: Int,_ endStart: Int,_ inNode: [Int],_ postNode: [Int]) -> TreeNode?{
        
        if postStart > postEnd {
            return nil
        }
        let root = TreeNode(postNode[postEnd])
        var index = 0
        for i in inStart...endStart{
            if inNode[i] == root.val{
                index = i
                break
            }
        }
        root.left = buileTreeHelper2(postStart,postStart + index - inStart - 1, inStart, index - 1, inNode, postNode)
        root.right = buileTreeHelper2(postEnd - endStart + index, postEnd - 1, index + 1, endStart, inNode, postNode)
  
        return root
    }
    
//    path sum II，根节点到任意叶子节点
    func pathSum(_ root:TreeNode?,_ sum: Int) -> [[Int]]{

        var res = [[Int]]()
        var nums = [Int]()
        pathSumHelper(root, &res, &nums, sum)
        return res
    }
    func pathSumHelper(_ root: TreeNode?,_ res: inout [[Int]],_ nums: inout [Int],_ sum: Int){
        guard  let root = root else {
            return
        }
        nums.append(root.val)
        if root.left == nil && root.right == nil && sum == root.val {
            res.append(nums)
        }
        pathSumHelper(root.left, &res, &nums, sum - root.val)
        pathSumHelper(root.right, &res, &nums, sum - root.val)
        nums.removeLast()
    }
    
//    path sum III ,任意节点到z叶子节点, 根节点到叶子节点 + 非根节点
    func pathSumIII(_ root: TreeNode?,_ sum: Int) -> Int{ // 方法一：利用前序遍历
        guard let root = root else {
            return 0
        }
        return pathHelper(root, sum) + pathSumIII(root.left, sum) + pathSumIII(root.right, sum)
    }
    func pathHelper(_ root: TreeNode?,_ sum: Int) -> Int{
        guard let root = root else {
            return 0
        }
        var result = 0
        if sum == root.val{
             result += 1
        }
        result += pathHelper(root.left, sum - root.val)
        result += pathHelper(root.right, sum - root.val)
        return result
    }
//    方法2： 利用hashMap建立所有路径之和和其个数之间的关系
    func pathSumIII2(_ root: TreeNode?,_ sum: Int) -> Int{
        guard let root = root else {
            return 0
        }
        var preSum = [Int: Int]()
        preSum[0] = 1
        return helperParhIII(root, &preSum, 0,sum)
    }
    
    func helperParhIII(_ root: TreeNode?,_ preSum: inout [Int: Int],_ sum: Int, _ target: Int) ->Int{
        guard let root = root else
        {
            return 0
        }
        var sum = sum
        sum += root.val
        var result = preSum[sum - target] ?? 0
        
        preSum[sum] = (preSum[sum] ?? 0) + 1
        result += helperParhIII(root.left, &preSum, sum, target) + helperParhIII(root.right, &preSum, sum, target)
        preSum[sum] = (preSum[sum] ?? 0) - 1
        
        return result
    }
    
    //    Unique Binary Search Trees II 给定任意整数，输出一个二叉搜索树
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n <= 0 {
            return []
        }
        return generateTreesHelp(1, n)
    }
    func generateTreesHelp(_ start: Int,_ end: Int) -> [TreeNode?]{
        if start > end {
            return [nil]
        }
        var res = [TreeNode?]()
        var leftTrees = [TreeNode?]()
        var rightTrees = [TreeNode?]()
        for i in start...end{
            leftTrees = generateTreesHelp(start, i - 1)
            rightTrees = generateTreesHelp(i + 1, end)
            
            for leftT in leftTrees{
                for rightT in rightTrees{
                    let root = TreeNode(i)
                    root.left = leftT
                    root.right = rightT
                    
                    res.append(root)
                }
            }
        }
        return res
    }
    
//    Unique Binary Search Trees 给定一个整数，求能组合成多少个二叉搜索树
//    func numTrees(_ n: Int) -> Int{
//        if n <= 1 {
//            return 1
//        }
//      var dp = [Int](repeatElement(0, count: n + 1))
//      dp[0] = 1
//      dp[1] = 1
//    
//        
//    }
}
