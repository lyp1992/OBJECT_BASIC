//
//  leetcode.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/22.
//  Copyright © 2019年 LYP. All rights reserved.
//

import Cocoa

class leetcode: NSObject {

//     字符串转成数字
    func stringToInt(_ str : String) -> Int {
        var numStr = ""
        var number = 0
        for char in str {
            if char == " " && numStr.isEmpty{
                continue
            }else if Int(String(char)) != nil{
                numStr.append(char)
            }else if (char == "+" || char == "-") && numStr.isEmpty{
                numStr.append(char)
            }else{
                break
            }
        }
        
        let maxInt = 2147483647
        let minINt = -2147483648
        if let numS = Int(numStr) {
            if numS > maxInt {
                return maxInt
            }else if numS < minINt {
                    return minINt
            }else{
                number = numS
            }
        }else if numStr.count > 1{
            if numStr.first == "-" {
                number = minINt
            }else {
                 number = maxInt
            }
        }
        
        return number
    }
    
//    数字反转
    func reverseInterger(_ num : Int) -> Int{
        var num = num
        var res = 0
        var symbol = 1
        if num < 0 {
            symbol = -1
        }
        num = symbol * num
        while num != 0 {
            res = res * 10 + num % 10
            num = num/10
        }
        res = symbol * res
        let maxInt = 2147483648
        let minInt = -2147483647
        if res > maxInt {
            return 0
        }
        if res < minInt {
            return 0
        }
        return res
    }
    
//    2的幂
    func powerOfTwo(_ num: Int) -> Bool{
        if num > 0{
            return (num & (num - 1) == 0)
        }else{
            return false
        }
    }
    
//    3的幂 3^x = n x = log3`(n)，思路，求出有效范围内，3的最大次幂，那么3的最大次幂可以被任何3的幂整除
    func powerOfThree(_ num: Int) ->Bool{
        
        let maxInt = 2147483648
        if num <= 0{
            return false
        }
       let maxInt1 = Double(maxInt)
       let num1 = Double(num)
        let max = Double(log2(maxInt1)/log2(num1))
        return Int(pow(3, max)) % 3 == 0
    }
    
//    46.排序，给定任意[1,2,3] 输出排序[[1,2,3],[1,3,2]...]
    func permuta(_ nums: [Int]) -> [[Int]]{
        var nums = nums
        var res = [[Int]]()
        permutaRecursive(&nums, 0, &res)
        return res;
    }
    private func permutaRecursive(_ nums: inout[Int],_ begin: Int,_ res: inout[[Int]]) {
        if  begin >= nums.count{
            res.append(nums)
            return
        }
        for i in begin..<nums.count {
            nums.swapAt(begin, i);
            permutaRecursive(&nums, begin+1, &res)
            nums.swapAt(begin, i);
        }
    }

//    [1,1,2]
    func permutation(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var combination = [Int]()
        var sknIndex = Set<Int>()
        var results = [[Int]]()
        permutaRecursive3(&nums, &combination, &sknIndex, &results)
        return results
    }
    private func permutaRecursive3(_ nums: inout [Int], _ combination: inout [Int], _ sknIndex: inout Set<Int>,_ results:inout [[Int]]){
        if combination.count == nums.count{
            results.append(combination)
        }
        
        for index in 0..<nums.count {
            if sknIndex.contains(index){
                continue
            }
            if (index > 0 && !sknIndex.contains(index - 1) && nums[index] == nums[index - 1]){
                continue
            }
            sknIndex.insert(index)
            combination.append(nums[index])
//             print("c + \(combination) + \(sknIndex)")
            permutaRecursive3(&nums, &combination, &sknIndex, &results)
            combination.removeLast()
            sknIndex.remove(index)
//            print("c - \(combination) - \(sknIndex)")
        }
        
    }
    
//    求平方根
    func mySqrt(_ x: Int) -> Int {
        var base = 1
        var t = base * base
        while t <= x{
            base *= 2
            t = base * base
        }
        var min = base/2
        var max = base
        var mid = 0
        while max - min > 1{
            mid = (max + min)/2
            if ( mid * mid) > x{
                max = mid
            }else {
                min = mid
            }
//            else
//            {
//                res = mid
//            }//加上这个判断会超市
        }
        return (min + max)/2
    }
    //    求平方根
    func mySqrt2(_ x: Int) -> Int {
    
        var left = 1
        var right = x
        var mid = 0
        while left <= right{
            mid = (left + right )/2
            if (mid * mid ) > x{
                right = mid - 1
            }else if(mid * mid) < x{
                left = mid + 1
            }else{
               return mid
            }
        }
        return (left + right)/2
    }
    func isPerfectSquare2(_ num: Int) -> Bool {
        
        var left = 1
        var right = num
        var mid = 0
        while left <= right{
            mid = (left + right)>>1
            if(mid * mid) == num{
                return true
            }else if (mid * mid) > num{
                right = mid - 1
            }else {
                left = mid + 1
            }
        }
        return false
    }
    func isPerfectSquare3(_ num: Int) -> Bool {
        
        var base = 1
        var t = base * base
        while t <= num{
            if t == num{
                return true
            }
            base *= 2
            t = base * base
        }
        var min = base/2
        var max = base
        var mid = 0
        while max - min >= 0{
            mid = (max + min)/2
            if ( mid * mid) > num{
                max = mid - 1
            }else  if (mid * mid) < num{
                min = mid + 1
            }else{
                return true
            }
        }
        return false
    }
    
    // 15. 3sum ，x三个数相加等于0
    
    func threeSum(_ nums: [Int]) -> [[Int]]{
        
        //    先给数组中的排序
        var n = nums
        n.sort()
        
        //    设置一个集合
        var aresult = [[Int]]()
        
        //    初始化index
        var cIndex : Int = 0
        var fIndex : Int = 0
        var bIndex : Int = 0
        let atarget : Int = 0
        while cIndex < (n.count - 2) {
            fIndex = cIndex + 1
            bIndex = n.count - 1
            while (fIndex < bIndex) && ((n[cIndex] + n[fIndex]) <= atarget ){
                
                let aSum = n[cIndex] + n[fIndex] + n[bIndex]
                if (aSum == atarget) {
                    let arr = [n[cIndex],n[fIndex],n[bIndex]]
                    aresult.append(arr)
                    bIndex -= 1
                    while (fIndex < bIndex ) && (n[bIndex + 1] == n[bIndex]) {
                        bIndex -= 1
                    }
                    fIndex += 1
                    while (fIndex < bIndex) && (n[fIndex - 1] == n[fIndex]) {
                        fIndex += 1
                    }
                    
                    
                }else if aSum > atarget {
                    bIndex -= 1
                }else{
                    fIndex += 1
                }
                
            }
            
            cIndex += 1
            while (n[cIndex - 1] == n[cIndex] ) && cIndex < n.count {
                cIndex += 1
            }
            
        }
        return aresult
    }

//    反转链表：
    func reverseLinkList(_ linkNode: ListNode?) ->ListNode?{
//        创建一个新的listNode
        var linkNode = linkNode
        var resNode:ListNode?
        
        while linkNode != nil {
            let tmp = linkNode!.next //备份next
            linkNode?.next = resNode // 更新head的next为新链表
            resNode = linkNode // 移动新链表的head指针
            linkNode = tmp // 遍历链表
        }
        return resNode
    }
    
    
    func reverseLinkList2(_ linkNode: ListNode?) ->ListNode?{
        return recursiveReversLink(linkNode, nil)
    }
    private func recursiveReversLink(_ curLink: ListNode?, _ prevLink: ListNode?) -> ListNode?{
        if  curLink == nil {
            return prevLink
        }
        let next = curLink?.next
        curLink?.next = prevLink
        return recursiveReversLink(next,curLink)
    }
    
    //    反转两个数之间 1-2-3-4-5-null ==> 1-4-3-2-5-null
    func reversBetween(_ head: ListNode?, _ m : Int,_ n: Int) ->ListNode?{
        var prev_to_start: ListNode?
        var start: ListNode? = head
        
        var prev: ListNode?
        var curr: ListNode?
        var curr_head: ListNode?
        
        var count = 1
        while count < m {// 将pre指向m-1 的位置，记录逆置数m的前一个数，比如，1->2->3从2开始逆置，记录2的前一个数1
            count += 1
            prev_to_start = start
            start = start?.next
        }
        
        curr_head = start
        while count <= n{ // 反转m-n间的数
//            1.备份head->next 2.更新head-next 3.更新newlist的head指针，4.遍历链表
            curr = curr_head
            curr_head = curr_head?.next
            curr?.next = prev
            prev = curr
            count += 1
        }
        
        start?.next = curr_head
        if prev_to_start != nil {
            prev_to_start?.next = curr
            return head
        }
        return curr
        
    }
    
//    反转链表变种：反转两数之间的数据 [1,2,3] 3 3
    func reverseBetweenYP(_ head: ListNode?,_ m:Int, _ n:Int) ->ListNode?{
        if head == nil {
            return nil
        }
        var tmpNode:ListNode?
        var tailNode:ListNode?
        var reverList:ListNode?
        var result = head
        var head = head
//       记住反转前的m的前一个值
        var count = 1
        while head != nil,count < m {
            tmpNode = head
            head = head?.next
            count += 1
        }
//        开始反转m - n之间的数
       tailNode = head //记住现在的链表头，反转之后就是链表尾
        while head != nil,count <= n{
            let tmp = head?.next
            head?.next = reverList
            reverList = head
            head = tmp
            count += 1
        }
        tailNode?.next = head //链接反转后链表尾和最后的一段节点，直接b改变指向即可。此时的head就是n的后一个值，tailNode就是链表尾部的值
        if tmpNode != nil {//说明反转前一个节点不是空
            tmpNode?.next = reverList
        }else{
            result = reverList // 如果是从第一个开始反转，那么直接返回反转后的值
        }
        return result
    }
    
    func reverseBetween2(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
//        0->1->2->3->4->5->6
        var pre: ListNode? = dummy
        for _ in 0..<(m - 1) {
            pre = pre?.next // 取第一个节点
        }
        //       思路，将pre 指向为1，start 指向2，end指向3 。需要断开2-3之间的链接，将2指向4 ，之后再将3指向2，最后将1指向3 变成1->3->2->4->5->6;依次类推，
        let start:ListNode? = pre?.next
        var end:ListNode? = start?.next
        for _ in 0..<(n-m) {
            start?.next = end?.next
            end?.next = pre?.next
            pre?.next = end
            end = start?.next
        }
        return dummy.next
    }
    
//    两两交换 1-2-3-4 => 2-1-4-3
    func reverseTwo(_ head:ListNode?) -> ListNode?{
    
//        创建 dummy节点
        let dummy:ListNode? = ListNode(0)
        dummy?.next = head
        var pre:ListNode? = dummy
        while ((pre?.next) != nil) &&  ((pre?.next?.next) != nil) {
//            取下一个节点
            let listN:ListNode? = pre?.next?.next // 取2
            pre?.next?.next = listN?.next // 修改1 -> 3
            listN?.next = pre?.next // 2->1
            pre?.next = listN // 0->2
            pre = listN?.next
        }
        return dummy?.next
    }
//    递归
    func reverseTwo2(_ head:ListNode?) -> ListNode?{
        
        if head == nil || head?.next == nil {
            return head;
        }
        let dummy:ListNode? = head
        return revercsrTwoRecur(dummy)
    }
    
    private func revercsrTwoRecur(_ head:ListNode?) -> ListNode?{
        let t:ListNode? = head?.next
        head?.next = revercsrTwoRecur(head?.next?.next)
        t?.next = head
        return t
    }
    
    //    旋转链表 思路L:定义快慢指针，快指针先走k步，然后一起走。当快指针走到最后的时候，慢指针的next就是新链表的头，难点L：k大于链表长度和小于链表长度的情况处理。当k大于链表长度时，对k进行取余
    func rotationList(_ head:ListNode?, _ k:Int) -> ListNode?{
        if head == nil || head?.next == nil{
            return head
        }
        var head = head
        var fast = head
        var slow = head
        var n = 0
        while head != nil {
            n += 1
            head = head?.next
        }
        var count = k % n //需要旋转的次数
        if count == 0 {
            return head
        }
        while fast?.next != nil,count > 0 {//快先走count步
            fast = fast?.next
            count -= 1
        }
        while fast?.next != nil {//两个一起走
            slow = slow?.next
            fast = fast?.next
        }
//        slow的next就是链表的起点
        let tmp = head
        head = slow?.next
        slow?.next = nil
        fast?.next = tmp
        
        return head
    }
    
//    动态规划-70-climbing stairs 爬楼梯
    func climbingStairs(_ n: Int) -> Int {
//        用递推的方式：递归+记忆数据 f(n) = f(n-1) + f(n-2)
        var results = [Int]()
        let f1 = 1
        let f2 = 2
        results.append(f1)
        results.append(f2)
        if n <= 2 {
            return n
        }
        for i in 2..<n{
           let result = results[i - 1] + results[i - 2]
            results.append(result)
        }
        return results.popLast()!
    }
    
//    Min Cost Climbing Stairs ，每个楼梯上有一个数字cost，求所有数字的最小和
    func minCostClimbingStairs(_ cost: [Int]) ->Int{
//        思路 创建存储步数的数组， 第一次：第一个是cost[0] 第二个是cost[1] 那么要接着往下走，再数组中，要想走上楼梯，可以是倒数第二个 + 2 或者倒数第一个 + 1， 所以我们只需要比较 数组中的最后两个元素即可。
        let n = cost.count
        var results = [Int]()
        results.append(cost[0])
        results.append(cost[1])
        for i in 2..<n{
            let minCost = cost[i] + min(results[i - 1], results[i - 2])
            results.append(minCost)
        }
        let num = results.count
        return min(results[num - 1], results[num - 2])
    }
    
    func minCostClimbingStairs2(_ cost: [Int]) -> Int {
        guard cost.count >= 2 else { return cost.first ?? 0 }
        
        var prevPrev = 0
        var prev = 0
        for i in 2...cost.count {
            let c = min(prev + cost[i-1], prevPrev + cost[i-2])
            prevPrev = prev
            prev = c
        }
        return prev
    }
    
//  Top K Frequent Elements 返回k个频繁出现的数字。[1,1,1,2,2,3,4] k = 2。 返回两个出现平凡的数字【1，2】 [4,1,-1,2,-1,2,3]
    func topKFrequentE(_ nums: [Int],_ k: Int) -> [Int]{
        var dict = [Int: Int]()
        for (_,num) in nums.enumerated() {
//            if dict[num] == nil{
//                dict[num] = 1
//            }else{
//                let count = dict[num]
//                dict[num] = count! + 1
//            }
            dict[num,default:0] += 1
        }
        
        return Array(dict.sorted(by:{$0.1>$1.1}).map{$0.0}[0..<k])
    }
    
//    二分查找
    func binarySearch(_ nums:[Int],_ target:Int) -> Int{
        var nums = nums
        var left = 0
        var right = nums.count - 1
        let target = target
        while left < right {
            let mid = (left + right)/2
            if nums[mid] > target {
                right = mid - 1
            }else if nums[mid] < target {
                left = mid + 1
            }else{
                return mid
            }
        }
        return -1
    }
    
//    Maximum Product Subarray 最大乘积子序列 [2,3,-4,5] 最大连续乘积是2*3 = 6
    
    func maxiNumProductSubarray(_ nums: [Int]) -> Int {
//        第一种方法，思路，需要三个变量 最大maxN 然后就是判断符号，maxT记住最大的值,如果前面的乘积<0 那么maxT从1开始，minT取记住最小的值，如果前面的乘积都大于0，那么最小值从1开始。
        var maxN = nums[0]
        var maxT = 1
        var minT = 1
        for i in 0..<nums.count {
            let tmp1 = maxT * nums[i]
            let tmp2 = minT * nums[i]
            maxN = max(maxN, tmp1, tmp2)
            maxT = max(tmp1, tmp2,1)
            minT = max(tmp1, tmp2,1)
        }
        return maxN
    }
    
//    Maximum Subarray
    func maxinumSubarray(_ nums:[Int]) -> Int {
//    思路，主要的还是当加起来的s值小于0 的时候c怎么处理，

        var maxN = nums[0]
        var maxT = 0
        for i in 0..<nums.count{
            let sum = maxT + nums[i]
            maxN = max(sum, maxN)
            maxT = max(sum, 0)
        }
        return maxN
    }
    
//    121. Best Time to Buy and Sell Stock
    func maxProfit(_ nums: [Int]) -> Int{
//        1. 暴力求解，两数相减，最大的那个就是最优解
        var nums = nums
        var max = 0
        for i in 0..<nums.count{
            for j in (i + 1)..<nums.count{
                if nums[j] - nums[i] > max{
                    max = nums[j] - nums[i]
                }
            }
        }
        return max
    }
   func maxProfit2(_ nums: [Int]) -> Int{
    if nums.count < 2 {return 0}
//   只用一个for
     var max = 0
    var minNum = nums[0]
    for i in 1..<nums.count{
        let curNum = nums[i]
        if curNum - minNum > max{
            max = curNum - minNum
        }
        if minNum > curNum{
            minNum = curNum
        }
    }
    return max
    }
//   123. Best Time to Buy and Sell Stock III 最多买卖两次
    func maxProfitTwo(_ nums: [Int]) -> Int{
        
//        正向取值
        var maxPosit = 0
        var positMin = nums[0]
        for i in 1..<nums.count{
            let cur = nums[i]
            if cur - positMin > maxPosit{
                maxPosit = cur - positMin
            }
            if positMin > cur{
                positMin = cur
            }
        }
        
//        反向取值
        var maxReverse = 0
        var n = nums.count - 1
        var reverMin = nums[n] // 取倒数第一个数
        n = n - 1 // 取倒数第二个数
        while n >= 0 {
            let cur = nums[n]
            if cur - reverMin > maxReverse{
                maxReverse = cur - reverMin
            }
            if reverMin > cur {
                reverMin = cur
            }
            n -= 1
        }
        
        
        return maxReverse + maxPosit
    }

    
    //   322. Coin Change，给定一个面值数组，和一个总额，得到使用面值最少张数组合等于总额 Input: coins = [1, 2, 5], amount = 11 Output: 3
    func coinChange(_ coins:[Int],_ amount: Int) -> Int{
        
//        思路：d动态规划，确定状态：dp[i] 代表步数，确定状态方程：dp[i] = min(dp[i],dp[i - coins[j]] + 1)
        var minCoin = [Int:Int]()
        minCoin[0] = 0
        return coinChangeBottomUp(coins,amount)
    }
    func coinChangeBottomUp(_ coins: [Int], _ amount: Int) -> Int {
        var minCoin = [Int:Int]()
        minCoin[0] = 0
        for coin in coins {
            for x in (0...amount) {
                if x >= coin {
                    if let min = minCoin[x], let prevMin = minCoin[x-coin], prevMin < min  {
                        minCoin[x] = prevMin + 1
                    }
                    else if minCoin[x] == nil, let prevMin = minCoin[x-coin] {
                        minCoin[x] = prevMin + 1
                    }
                }
            }
        }
        return minCoin[amount] ?? -1
    }
    
//    递归解题：
    func coinsChangeTopUp(_ minCoins: inout [Int: Int],_ coins:[Int],_ amount: Int) -> Int{
        if let value = minCoins[amount]{
            return value
        }
        var min = Int.max
        for coin in coins {
            if coin <= amount{
                let res = coinsChangeTopUp(&minCoins, coins, amount)
                if res != -1 && (res + 1 <= amount){
                    min = res + 1
                }
            }
        }
        if min != Int.max {//Found a solution, memorize it
            minCoins[amount] = min
        }
        else {    //if no solution is found, label it as -1, can't form the change
            minCoins[amount] = -1
        }
        return minCoins[amount]!
    }
    
//    100.same tree DFS ，深度遍历
    func sametree(_ p: TreeNode?, _ q: TreeNode?) -> Bool{
        
        if p == nil && q == nil{
            return true
        }
        if p == nil || q == nil {
            return false
        }
        
        if p?.val == q?.val {
            return sametree(p?.left,q?.left) && sametree(p?.right,q?.right)
        }
        return false
    }
//    BFS 广度遍历
    func isSameTree(_ q: TreeNode?, _ p: TreeNode?) -> Bool{
//        创建栈 先进后出
        var qStack = [TreeNode]()
        var pStack = [TreeNode]()
        
        if let p = p{
            pStack.append(p)
        }
        if let q = q {
            qStack.append(q)
        }
        while !pStack.isEmpty && qStack.isEmpty{
            let pNode = pStack.removeLast()
            let qNode = qStack.removeLast()
            if qNode.val != pNode.val{
                return false
            }
            if let pRightNode = pNode.right{
                pStack.append(pRightNode)
            }
            if let qRightNode = qNode.right{
                qStack.append(qRightNode)
            }
            if qStack.count != pStack.count{
                return false
            }
            if let pLeftNode = pNode.left{
                pStack.append(pLeftNode)
            }
            if let qLeftNode = qNode.left{
                qStack.append(qLeftNode)
            }
            if qStack.count != pStack.count{
                return false
            }
            
        }
        return qStack.count == pStack.count
    }
    
//    101. Symmetric Tree 对称树
    func symmetricTree(_ root: TreeNode?) -> Bool{
//        BFS 广度遍历，并且利用栈，先进后出
        if root == nil{
            return false
        }
        var leftQ = [TreeNode]()
        var rightQ = [TreeNode]()
        
        if let left = root?.left {
            leftQ.append(left)
        }
        if let right = root?.right {
            rightQ.append(right)
        }
        while leftQ.count != 0 && rightQ.count != 0{
            let leftN = leftQ.removeLast()
            let rightN = rightQ.removeLast()
            if leftN.val != rightN.val{
                return false
            }
            if let leftNL = leftN.left{
                leftQ.append(leftNL)
            }
            if let rightNR = rightN.right{
                rightQ.append(rightNR)
            }
            if leftQ.count != rightQ.count{
                return false
            }
            
            if let leftNR = leftN.right{
                leftQ.append(leftNR)
            }
            if let rightNL = rightN.left{
                rightQ.append(rightNL)
            }
            if leftQ.count != rightQ.count {
                return false
            }
        }
        return leftQ.count == rightQ.count
    }
    func symmetricTree_DFS(_ root: TreeNode?) -> Bool{
        
        if root == nil
        {
            return true
        }
        return symmetricTree_helper(root?.left, root?.right)
    }
    func symmetricTree_helper(_ left:TreeNode?,_ right: TreeNode?) -> Bool{
        
        guard let leftQ = left, let rightQ = right else {
            return left === right
        }
        if leftQ.val != rightQ.val{
            return false
        }
        return symmetricTree_helper(leftQ.left,rightQ.right) && symmetricTree_helper(leftQ.right,rightQ.left)
    }
    
//    104 树的深度
//    DFS
    func maxDeepth(_ root: TreeNode?) -> Int{
    
        if root == nil {
            return 0
        }
        return max(maxDeepth(root?.left), maxDeepth(root?.right)) + 1
    }
    
//    BFS
    func maxDeepth_BFS(_ root: TreeNode?) -> Int{
        
        guard let root = root else{
            return 0
        }
        var maxDeepth = 0
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count{
                let node = queue.removeFirst()
                if let left = node.left{
                    queue.append(left)
                }
                if let right = node.right{
                    queue.append(right)
                }
            }
            maxDeepth += 1
        }
        return maxDeepth
    }
    
//    107. Binary Tree Level Order Traversal II 层次遍历 自下而上
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
//     BFS
        guard let root = root else {
            return []
        }
        var nodeSet = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let count = queue.count
            var nodeArr = [Int]()
            for _ in 0..<count{
                let node = queue.removeFirst()
                nodeArr.append(node.val)
                if let nodeL = node.left{
                    queue.append(nodeL)
                }
                if let nodeR = node.right{
                    queue.append(nodeR)
                }
            }
//            nodeSet.append(nodeArr) //顺序
            nodeSet.insert(nodeArr, at: 0) //逆序
            
        }
        return nodeSet
    }
    
//    DFS
    func levelOrderBottom_DFS(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        var levelLists = [[Int]]()
        levelOrderBottom_DFSHelper(root, &levelLists, 0)
        return levelLists
    }
    func  levelOrderBottom_DFSHelper(_ root: TreeNode?,_ levelLists: inout [[Int]],_ level: Int) {
        guard let root = root else
        {
            return
        }
        if level >= levelLists.count{
            levelLists.insert([Int](), at: 0)
        }
        levelOrderBottom_DFSHelper(root.left, &levelLists, level + 1)
        levelOrderBottom_DFSHelper(root.right, &levelLists, level + 1)
        levelLists[levelLists.count - level - 1].append(root.val)
    }
    
//    108 将一个有序数组，放到二叉搜索树中
    func sortedArrayToBST(_ nums:[Int]) -> TreeNode?{
        if nums.count == 0{
            return nil
        }
        let root = sortedArrayToBST_helper(nums, 0, nums.count - 1)
        return root
    }
    func sortedArrayToBST_helper(_ nums: [Int],_ low: Int,_ high: Int) -> TreeNode? {
        if low > high{
            return nil
        }
        let mid = (low + high)/2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST_helper(nums, low, mid - 1)
        node.right = sortedArrayToBST_helper(nums, mid + 1, high)
        return node
    }
    
//    110 判断是否是平衡二叉树
    func isBalaceBST(_ root: TreeNode?) -> Bool {
        guard let root = root else{
            return true
        }
        return isBalaceBST_helper(root) != -1
    }
    func isBalaceBST_helper(_ root: TreeNode?) -> Int{
        guard let root = root else {
            return 0
        }
        let leftHeight = isBalaceBST_helper(root.left)
        let rightHeight =  isBalaceBST_helper(root.right)
        
        if leftHeight == -1 || rightHeight == -1 || abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        
        return max(leftHeight, rightHeight) + 1
        
    }
    
    func isBalaceBST2(_ root: TreeNode?) -> Bool
    {
        guard let root = root else
        {
            return true
        }
        return abs(isBalaceBST2_helper(root.left) - isBalaceBST2_helper(root.right)) <= 1 && isBalaceBST2(root.left) && isBalaceBST2(root.right)
    }
    func isBalaceBST2_helper(_ root: TreeNode?) -> Int{
        guard let root = root else {
            return 0
        }
        return max(isBalaceBST2_helper(root.left), isBalaceBST2_helper(root.right)) + 1
    }
    
//    最小深度
    func minDepth(_ root: TreeNode?) -> Int{//DFS
        guard let root = root else
        {
            return 0
        }
        
        if root.left == nil{//度为1
            return minDepth(root.right) + 1
        }
        if root.right == nil{//度为1
            return minDepth(root.left) + 1
        }
        return min(minDepth(root.left),minDepth(root.right)) + 1 // 度为2
    }
    
    func minDepthBFS(_ root: TreeNode?) -> Int {
        guard let root = root else{
            return 0
        }
        var queue = [TreeNode]()
        var depth = 0
        queue.append(root)
        while !queue.isEmpty {
            let count = queue.count
            depth += 1
            for _ in 0..<count{
                let node = queue.removeFirst()
                if node.left == nil && node.right == nil{//度为0
                    return depth
                }
                if let left = node.left{
                    queue.append(left)
                }
                if let right = node.right{
                    queue.append(right)
                }
            }
        }
        return depth
    }
    
//    112
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
//        DFS
        guard let root = root else{
            return false
        }
        if root.left == nil && root.right == nil{
            return sum - root.val == 0
        }
        return hasPathSum(root.left,sum - root.val) || hasPathSum(root.right, sum - root.val)
    }
    
//    226. Invert Binary Tree 反转二叉树
    func invertBinaryTree(_ root: TreeNode?) -> TreeNode?{
        guard let root = root else {
            return nil
        }
        let tmp = root.left
        root.left = root.right
        root.right = tmp
        invertBinaryTree(root.left)
        invertBinaryTree(root.right)
        
        return root
    }
    
//    257. Binary Tree Paths  d输出根到叶的所有路径
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
//        DFS
        guard let root = root else {
            return []
        }
        var paths = [String]()
        binaryTreePathsDFS(root, "", &paths)
        return paths
    }
    
    func binaryTreePathsDFS(_ root: TreeNode,_ path:String,_ paths: inout [String]){
        if root.left == nil && root.right == nil{
            paths.append(path + String(root.val))
            return
        }
        if let left = root.left {
            binaryTreePathsDFS(left, path + String(root.val
                ) + "->", &paths)
        }
        if let right = root.right{
            binaryTreePathsDFS(right, path + String(root.val) + "->", &paths)
        }
        
    }
    
//   给定一个大小为n的数组，里面的数据f满足范围【0，n-1】，不确定重复元素，找到至少一个重复元素。[0,3,3,4,5,6,7,1] 思路L：符号位标记法，取数组index对应的的value，和n进行比较,(第一次取出来的数都满足范围【0，n-1】)如果不大于n，把value当做index 存入数组中，如果有重复的数，那么用相同的数value取变化后数组中取出的value1就会不小于n，那么此时的value就是重复的值
    func findRepeatElement(_ arr:[Int]) -> Int{
        var arr1 = arr
        let n = arr.count
        for (_,value) in arr1.enumerated() {
            let rindex = value >= n ? (value - n):value
            if arr1[rindex] >= n{
                return rindex
            }
            arr1[rindex] = arr1[rindex] + n
        }
        return -1 //没找到
    }
    func printArr(_ arr:[Int]) {
        for (index) in arr.enumerated() {
            print("\(index)" + "\n")
        }
    }
//    217. Contains Duplicate 重复元素
//    func containsDuplicate(_ nums: [Int]) -> Bool {
//        
//        var nums = nums
//        var haspMap = [Int:Int]()
//      
//        
//    }
    
//    动态规划值切割绳子，给一段长度为n的绳子，切割成m份，n>1,m>1,求f(1),f(2),f(3),f(4)....F(m)的最大乘积。比如当n = 8时，最大乘积应该是2 * 3 * 3 = 18，假如第一段是f(i) 最大，那么d余下的f(n - i) 和 f(i)的乘积最大，于是得到 f(n) = max(f(i)*f(n - i))。为了不重复切割，所以 i <= n/2

    func maxLargestProduct(_ length: Int ) -> Int {
        let length = length
        if length < 2 {
            return 0
        }
        if  length == 2 {
            return 1
        }else if length == 3{
            return 2
        }
        
        var dp = [Int](repeating: 0, count: (length + 1))//创建一个数组，记录每次的乘积
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        dp[3] = 3
        let n = length/2
        for i in 4...length {
            var max = 0
            for j in 1..<n{
                let product = dp[j] * dp[i - j]
                if product > max{
                    max = product
                     dp[i] = max
                }
            }
         
        }
        return dp[length]
    }
    
    //   3. 无重复字符的最长子串:
//    思路：简历一个hashmap，将读取到的字符串往map中添加，如果遇到相同的，将map中这个值置空，设置一个变量j记录重复数据的次数,maxcount记录当前hashmap中最大的无重复子序列
    func longestString(_ string:String) -> Int{
        let arr = Array(string)
        var hashMap = [Character: Int]()
        var maxCount = 0
        var j = 0 //记录重复数据的次数
        var i = 0
        while i < arr.count {
            if hashMap[arr[i]] == nil{
                hashMap[arr[i]] = 0
                maxCount = max(maxCount, i - j + 1)
                i += 1
            }else{
                hashMap[arr[j]] = nil
                j += 1
            }
        }
//        以下的写法是错的 i 不能一直加，这里的逻辑应该是，删除haspmap中第一个重复的数，然后在往haspmap中加入后面最后一次出现的数。所以要记住删除前的下标，才能往hasomap中添加
//        for i in 0..<arr.count {
//            if hashMap[arr[i]] == nil{
//                hashMap[arr[i]] = 0
//                maxCount = max(maxCount, i - j + 1)
//            }else{
//                hashMap[arr[j]] = nil
//                j += 1
//            }
//        }
        return maxCount
    }
//    方法二：用指针去记录重复数据的下标，设置left 和right 指针，right指针跟随循环自加，left指向第一个元素，如果有重复的，将left指针重复的那个元素。然后result = right - left + 1
    func longestString2(_ string: String) -> Int {
        let arr = Array(string)
        if arr.count == 0 {
            return 0
        }
        var left = 0
        var right = 1
        var res = right - left + 1
        var i = 0
        while right < arr.count {
            i = left
            while i < right{
                if arr[i] == arr[right]{
                    left = i + 1
                    break
                }
                i += 1
            }
            res = max(res, right - left + 1)
            right += 1
        }
        return res
    }
    
//    最长公共前缀 14 思路：取sz字符串长度最短的那个，遍历所有的数据，看看是否包含这个词
    func longestCommonPre(_ strings:[String]) -> String{
        if strings.count == 0{
            return ""
        }
        let strArr = strings
        let shortestStr = strArr.min{$0.count < $1.count}!
        var logestPre = shortestStr
        for str in strArr{
                while !str.hasPrefix(logestPre),logestPre.count > 0{
                    logestPre.removeLast()
                }
        }
        return logestPre
    }
    
//    567. Permutation in String 两个字符串，第一个字符串的全排列是第二个字符串的子字符串
    
}

