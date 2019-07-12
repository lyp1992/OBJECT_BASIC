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
    
    //    Unique Binary Search Trees 给定一个整数，求能组合成多少个二叉搜索树: 卡特兰数，给定一个节点，他可能的排列组合是左右子树可能排列组合的乘积 C(t+1) += C(i) * C(t - i)
    func numTrees(_ n: Int) -> Int{
        if n <= 1 {
            return 1
        }
      var dp = [Int](repeatElement(0, count: n + 1))
      dp[0] = 1
        for j in 1...n {
            for k in 0..<j{
                dp[j] += dp[k] * dp[j - 1 - k]
            }
        }
      return dp[n]
    }
    
//    Recover Binary Search Tree 修复二叉搜索树
//   方法一：思路，设置三个指针，first sec pre pre记住当期那节点的前一个节点值，如果前一个节点大于当前节点，那么设置给first，如果first有值，则设置给sec，最后如果有值，替换
    var firstEle: TreeNode? = nil
    var secondEle: TreeNode? = nil
    var preEle = TreeNode(Int.min)
    func recoverBST(_ root: TreeNode?) {

        inorderRecoverBst(root)
        let tmp = secondEle!.val
        secondEle?.val = firstEle!.val
        firstEle?.val = tmp
        
    }
    func inorderRecoverBst(_ root: TreeNode?){
        if root == nil{
            return
        }
        
        inorderRecoverBst(root?.left)
        if firstEle == nil && preEle.val >= root!.val{
            firstEle = preEle
        }
        if firstEle != nil && preEle.val >= root!.val {
            secondEle = root
        }
        preEle = root!
        inorderRecoverBst(root?.right)
    }
    
//     方法二： 设置两个一维变量，一个记录节点，另一个记录节点值，将节点值排序之后，z赋值给节点
    var list = [TreeNode?]()
    var listVal = [Int]()
    func revocerBst2(_ root: TreeNode?){
    
        inorderTree(root)
        listVal.sort()
        for (i,val) in listVal.enumerated(){
            let node = list[i]
            node?.val = val
        }
        
    }
    func inorderTree(_ root: TreeNode?) {
        
        if root == nil{
            return
        }
        inorderTree(root?.left)
        list.append(root)
        listVal.append(root!.val)
        inorderTree(root?.right)
    }
    
//    129. Sum Root to Leaf Numbers 从根节点到所有节点的和
//     1
//    / \
//    2   3
//    Therefore, sum = 12 + 13 = 25.
    func sumNumbers(_ root:TreeNode?) -> Int{
        return sumNumbersHelper(root, 0)
    }
    func sumNumbersHelper(_ root: TreeNode?,_ sum: Int) -> Int{
        guard let root = root else {
            return 0
        }
        let val = sum * 10 + root.val
        if root.left == nil && root.right == nil{
            return val
        }
        return sumNumbersHelper(root.left,val) + sumNumbersHelper(root.right, val)
    }
    
    func sumNumbers_stack(_ root:TreeNode?) -> Int{
        guard let root = root else{
            return 0
        }
        var stack = [(node: root,nodeVal:root.val)]
        var result = 0
        while !stack.isEmpty {
            let item = stack.removeLast()
            if item.node.left == nil && item.node.right == nil{
                result += item.nodeVal
            }
            if let left = item.node.left{
                stack.append((node: left, nodeVal: item.nodeVal * 10 + left.val))
            }
            if let right = item.node.right{
                stack.append((node: right, nodeVal: item.nodeVal * 10 + right.val))
            }
        }
        return result
    }
    
    //    124. Binary Tree Maximum Path Sum Input: [-10,9,20,null,null,15,7]
//
//    -10
//    / \
//    9  20
//    /  \
//    15   7
//    Output: 42
    func maxPathSum(_ root: TreeNode?) -> Int{
        var res = Int.min
        maxPathSumHelper(root, &res)
        return res
    }
    func maxPathSumHelper(_ root: TreeNode?, _ res:inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let left = max(maxPathSumHelper(root.left, &res), 0)
        let right = max(maxPathSumHelper(root.right, &res), 0)
        res = max(res, left + right + root.val)
        return max(left, right) + root.val
    }
    
//    236 最近公共祖先 思路：1，找到要搜索的节点，并且将经过的s路劲记录下 2，找到两条路径的距离根节点最远的公共节点。eg 3->5->6
//                          3->5->4->2
    func lowestCommonAncestor(_ node:TreeNode?,_ pNode: Int,_ qNode: Int) -> Int{
        
        var qStack = [Int]()
        var pStack = [Int]()
        let node = node
        var qres = [Int]()
        var pres = [Int]()
        var pfinish = false
        var qfinish = false
//      搜索路劲
        lowestCommonAncestor_helper(node, &pStack, pNode, &pres, &pfinish)
        lowestCommonAncestor_helper(node, &qStack, qNode, &qres, &qfinish)
        
//      查找距离跟节点最远的公共点
        return lowestCommonAncestor_helper2(pres, qres)
    }
    func lowestCommonAncestor_helper2(_ pres: [Int],_ qres: [Int]) -> Int{
        var res = 0
        for (_,pval) in pres.enumerated() {
            for (_, qval) in qres.enumerated(){
                if pval == qval{
                    res = pval
                }
            }
        }
        return res
    }
    func lowestCommonAncestor_helper(_ node:TreeNode?,_ path: inout [Int],_ searchNode:Int,_ res: inout [Int],_ finish:inout Bool){
        
        if node == nil || finish == true {
            return
        }
        path.append(node!.val)
        if node!.val == searchNode{
            finish = true
            res = path
        }
        lowestCommonAncestor_helper(node?.left, &path, searchNode,&res, &finish)
        lowestCommonAncestor_helper(node?.right, &path, searchNode,&res, &finish)
        path.removeLast()
    }
    
//    114. Flatten Binary Tree to Linked List、将树转换成链表
//    思路：1.前序遍历y所有的元素，然后加入到链表中，但是这种方法不满足原地排序
    func flatten(_ root: TreeNode?) {
        var queue = [TreeNode]()

        flatten_helper(root, &queue)
        if queue.count <= 1 {
            return
        }
        for i in 1..<queue.count {
            let left = queue[i]
            let right = queue[i - 1]
            right.left = nil // 将左节点置空
            right.right = left
        }
    }
    func flatten_helper(_ root: TreeNode?,_ queue: inout [TreeNode]){
        if root == nil {
            return
        }
        queue.append(root!)
        flatten_helper(root?.left, &queue)
        flatten_helper(root?.right, &queue)
    }
    
//    199. Binary Tree Right Side View 侧面观察二叉树，将侧面观察到的数据输出
//    思路：层次遍历二叉树，输出每一层的最后一个点
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var queue = [TreeNode]()
        var res = [Int]()
        queue.append(root!)
        while queue.count > 0 {
            let count = queue.count
            for i in 0..<count{
                let node = queue.removeFirst()
                if i == 0{
                    res.append(node.val)
                }
                if let right = node.right{
                    queue.append(right)
                }
                if let left = node.left{
                    queue.append(left)
                }
            }
        }
        return res
    }
    
/******问题归属于二叉树*********/
//    35. Search Insert Position 往数组中插入一个数二分查找，然后插入。
//    思路：二分查找，当target 在nums中，直接返回mid 如果不在，那么1、target>mid && target < mid + 1  2、target<mid && target>mid-1 3、临界：mid == 0 || mid == count
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var index = -1
        var begin = 0
        var end = nums.count - 1
        while index == -1 {
            let mid = (begin + end)/2
            if target == nums[mid]{
                index = mid
            }else if target < nums[mid]{
                if mid == 0 || target > nums[mid - 1]{
                    index = mid
                }
                end = mid - 1
            }else if target > nums[mid]{
                if  mid == nums.count - 1 || target < nums[mid + 1]{
                    index = mid + 1
                }
                begin = mid + 1
            }
        }
        return index
    }
    
//    34. Find First and Last Position of Element in Sorted Array  给定一个排序数组和一个target。求这个target在数组中出现的区间。eg：[5,7,7,8,8,8,8,10] target = 8 返回[3,6] 。如果target = 6 返回[-1,-1],
//    思路：我们要求左端点和右端点。如果target 在nums 中。target == mid && target > mid - 1 那么左端点就是mid - 1 或者target == mid &&target < mid + 1 那么右断点就是mid + 1
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var res = [Int]()
        let left = left_bound(nums, target)
        let right = right_bound(nums, target)
        res.append(left)
        res.append(right)
        return res
    }
    func left_bound(_ nums:[Int],_ target:Int) ->Int{
        var begin = 0
        var end = nums.count - 1
        while begin <= end {
            let mid = (begin + end)/2
            if target == nums[mid]{
                if mid == 0 || nums[mid - 1] < target{
                    return mid
                }
                end = mid - 1
            }else if (target > nums[mid]){
                begin = mid + 1
            }else if (target < nums[mid]){
                end = mid - 1
            }
        }
        return -1
    }
    func right_bound(_ nums:[Int],_ target:Int) ->Int{
        var begin = 0
        var end = nums.count - 1
        while begin <= end {
            let mid = (begin + end)/2
            if target == nums[mid]{
                if mid == nums.count - 1 || nums[mid + 1] > target{
                    return mid
                }
                begin = mid + 1
            }else if (target > nums[mid]){
                begin = mid + 1
            }else if (target < nums[mid]){
                end = mid - 1
            }
        }
        return -1
    }
    
//    33. Search in Rotated Sorted Array 旋转数组：给定一个数组，起先是一个有序的，但是他可以将内部的元素旋转。比如[1,2,3,4,5,6,7]->[4,5,6,7,1,2,3] 给定一个target，问，target在不在数组中
//    思路：确定递增区间，和旋转区间。然后去对应的区间寻找target
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var begin = 0
        var end = nums.count - 1
        while begin <= end {
            let mid = (begin + end)/2
            if target == nums[mid]{
                return mid
            }else if (target < nums[mid]){//确认递增区间和旋转区间
                if nums[begin] < nums[mid]{//递增区间
                    if target >= nums[begin]{
                        end = mid - 1
                    }else{
                        begin = mid + 1
                    }
                }else if(nums[begin] > nums[mid]){
                    end = mid - 1
                }else if nums[begin] == nums[mid]{
                    begin = mid + 1
                }
                
            }else if (target > nums[mid]){
                if nums[begin] < nums[mid]{
                    begin = mid + 1
                }else if (nums[begin] > nums[mid]){//begin mid 旋转区间
                    if target >= nums[begin]{
                        end = mid - 1
                    }else {
                        begin = mid + 1
                    }
                }else if (nums[begin] == nums[mid]){
                    begin = mid + 1
                }
            }
        }
        return -1
    }
    
  
}
