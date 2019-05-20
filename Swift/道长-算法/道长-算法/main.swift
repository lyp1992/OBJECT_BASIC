//
//  main.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/16.
//  Copyright © 2019年 LYP. All rights reserved.
//

// 面试中常问的几个算法题：
/*
// 数组
 (1) 在一个元素为 1 到 100 的整数数组中，如何搜索缺失元素?
/*
 解法：一、使用haspmap，将1-100作为key，遍历数组，将haspmap的值加1，取出值为0的数就是缺失的元素，时间O(1）空间O(N)
    二、将数组排序，两两相减，不是1的中间就是缺失元素 时间O(nlogn）空间O(1)
    三、将1-100的数相加，然后依次减去数组中的数，最后剩下的就是确实元素
 
 */
 (2) 给定一个数组，如何搜索重复元素?
/*
 思路：利用haspMap，元素作为key 出现的次数作为value，最后大于1的就是重复的元素。
 
 题目扩展L给定一个大小为n的数组，里面的数满足范围【0，n-1】,有不确定的重复元素，找到至少一个重复元素；
 解法：利用x符号位标记法。第一步：取出value，如果value 不大于n 设置第三个变量rIndexI，arr[rIndex] < n (不是重复进去肯定是符合要求的) 否则arr【rIndex】= arr【rIndex】+ n
 题目扩展：1.一个无序数组里有若干个正整数，范围从1到100，其中99个整数都出现了偶数次，只有一个整数出现了奇数次（比如1,1,2,2,3,3,4,5,5），如何找到这个出现奇数次的整数？
 解法：使用异或，偶数次的最后都会为0，奇数次的会留下
 
 题目扩展：2、一个无序数组里有若干个正整数，范围从1到100，其中98个整数都出现了偶数次，只有两个整数出现了奇数次（比如1,1,2,2,3,4,5,5），如何找到这个出现奇数次的整数？
 解法：使用异或，最后留下的就是奇数次的数的异或。然后再将两个奇数次的分到不同的数组中，依次异或，就能得到相应的值
 */
 (3) 给定一个乱序数组，如何搜索最大和最小元素?
 (4) 给定一个数值，如何搜索整数数组中加和为该数值的成对元素?
 (5) 如果数组包含多个重复值，如何搜索所有重复值?
 (6) 给定一个数组，如何用 Java 删除重复元素?如何在不使用库的情况下移除数组中的重复元素?
 (7) 如何使用快速排序算法对整数数组进行排序?
 (8) 如何使用 Java 反转一个数组?
 
// 链表
 (9) 如何在一次传递中找到单链表的中间元素?
 (10) 如何检查给定的链表是否包含循环?如何找到循环的起始节点?
 (11) 如何反转链表?
 (12) 在没有递归的情况下如何反转单链表?
 (13) 如何删除乱序链表中的重复节点?
 (14) 如何测量单链表的长度?
 (15) 如何从单链表的末端找出第三个节点?
 (16) 如何使用堆栈算出两个链表的总和?
 
// 字符串
 (17) 如何打印字符串中重复的字符?
 (18) 如何检查两个字符串是否互为逆序?
 (19) 如何打印字符串中首个非重复字符?
 (20) 如何使用递归反转给定字符串?
 (21) 如何检查一个字符串是否仅包含数字?
 (22) 如何搜索字符串中的重复字符?
 (23) 给定一个字符串，如何统计元音数和辅音数?
 (24) 给定一个字符，如同计算它在字符串中出现的次数?
 (25) 如何搜索一个字符串的所有排列情况?
 (26) 在不使用任何库的情况下，如何反转给定句子中的单词?
 (27) 如何检查两个字符串是不是互为旋转(rotation)?
 (28) 给定一个字符串，如何检查它是不是回文结构?
 
// 树
 (29) 如何实现二叉搜索树?
 (30) 如何对给定二叉树执行前序遍历?
 (31) 如何在没有递归的情况下对给定二叉树执行前序遍历?
 (32) 如何对给定二叉树执行中序遍历?
 (33) 如何在没有递归的情况下通过对给定二叉树执行中序遍历来打印所有节点?
 (34) 如何实现后序遍历算法?
 (35) 如何在没有递归的情况下对给定二叉树执行后序遍历?
 (36) 如何打印二叉搜索树的所有叶节点?
 (37) 如何计算给定二叉树中叶节点的数量?
 (38) 如何在给定数组中执行二元搜索?
 
// 其他题
 (39) 如何实现冒泡排序算法(bubble sort algorithm)?
 (40) 如何实现迭代快速排序算法(iterative quicksort algorithm)?
 (41) 如何实现插入排序算法(insertion sort algorithm)?
 (42) 如何实现归并排序算法(merge sort algorithm)?
 (43) 如何实现桶排序算法(bucket sort algorithm)?
 (44) 如何实现计数排序算法(counting sort algorithm)?
 (45) 如何实现基数排序算法(radix sort algorithm)?
 (46) 如何在不使用第三个变量的前提下交换两个数字?
 (47) 如何确认两个矩形是否重叠?
 (48) 如何设计自动贩卖机?
 
 
// 字节跳动
 3. 无重复字符的最长子串
 14. 最长公共前缀
 567. 字符串的排列
 43. 字符串相乘
 151. 翻转字符串里的单词
 93. 复原IP地址
 
 二、数组与排序
 15. 三数之和
 674. 最长连续递增序列
 
 三、链表与树
 2. 两数相加
 148. 排序链表
 142. 环形链表 II
 236. 二叉树的最近公共祖先
 
 四、动态或贪心
 121. 买卖股票的最佳时机
 122. 买卖股票的最佳时机 II
 221. 最大正方形
 */

import Foundation

 let nums = [-1,1,2,2,0]
 var dic : SetAndDict = SetAndDict()
 let arr = dic.twoNum2(nums, 1)
// print(arr)

var char = "the sky is blue"
var stringTool: StringTool = StringTool()
let str = stringTool.reverseWords(str: char)
//print(str!)

let list: List = List()
list.appendTail(1)
list.appendTail(2)
list.appendTail(4)
list.appendTail(5)
list.appendTail(2)
list.appendTail(1)

//list.printList(list.head)

let dummy: Dunmy = Dunmy()
let node = dummy.partition(list.head, 3)
//list.printList(node)

let deleteNode = dummy.deleteEelments(node, 5)
//list.printList(deleteNode)


let stackPath: StackPath = StackPath()

let path = stackPath.simplePath("/a/./b/../../c/")
//print("path =" + path)

let o_2tool:O_2Tool = O_2Tool()

let arrSort = [4,6,5,2,1,3,7,9,8]

//print(o_2tool.bubbleSort(arrSort))
//print(o_2tool.selectSort(arrSort))
//print(o_2tool.insertSort(arrSort))
let nums1 = [1,1,3]
let leetc: leetcode = leetcode()
//print(leetc.powerOfThree(27))
//print(leetc.permuta(nums1))
//print(leetc.permuta(nums1))
//print(leetc.isPerfectSquare3(1))
let threSum = [-4,-2,-2,-2,0,1,2,2,2,3,3,4,4,6,6]
//print(leetc.threeSum(threSum))

//print(leetc.permutation(nums1))

let list2: List = List()
list2.appendTail(1)
list2.appendTail(2)
list2.appendTail(3)
list2.appendTail(4)
list2.appendTail(5)
list2.appendTail(6)

var listN:ListNode?
//listN = leetc.reverseTwo(list2.head)
listN = leetc.reverseTwo2(list2.head)
//list.printList(listN)

//print(leetc.climbingStairs(4))

let nums2 = [10, 15, 20]
//print(leetc.minCostClimbingStairs2(nums2))

//print(leetc.topKFrequentE([4,1,-1,2,-1,2,3], 2))

//print(leetc.binarySearch([-1,0,3,5,9,12], 9))
//[-4,-3]
//print(leetc.maxiNumProductSubarray([0,-2,3]))

//print(leetc.coinChange([1, 2, 5], 11))

//print(leetc.maxProfitTwo([3,3,5,0,0,3,1,4]))

//let leCtree = LeetCodeTree()
//let letNodeT = TreeNodeTool()
//let inNode = letNodeT.creatTree([9,3,15,20,7])
//let postNode = letNodeT.creatTree([9,15,7,20,3])

//print(leetc.findRepeatElement([0,2,3,4,5,6,2]))

//print(leetc.maxLargestProduct(9))

//print(leetc.longestString2("abcabcbb"))

print(leetc.longestCommonPre(
    ["flower","flow","flight"]))
