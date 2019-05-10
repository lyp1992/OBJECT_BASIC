//
//  StackPath.swift
//  道长-算法
//
//  Created by 赖永鹏 on 2019/4/17.
//  Copyright © 2019年 LYP. All rights reserved.
//

//面试题，输入/home/ 输出/home 输入/a/./b/../../c 输出/c 规则是遇到. 输出上一个eg：/a/./->/a 遇到.. 输出上上个 eg:/a/b/..->/a
import Cocoa

class StackPath: NSObject {

    func simplePath(_ path: String) -> String {
//        创建数组来实现栈的功能
        var pathStack = [String]()
        
//        拆分原路径
        let paths = path.components(separatedBy: "/")
        for path in paths {
//            对于. 我们直接跳过
            guard path != "." else{
                continue
            }
//            对于.. 我们采用pop操作
            if path == ".."{
                if pathStack.count > 0{
                    pathStack.removeLast()
                }
            }else if (path != ""){
                pathStack.append(path)
            }
        }
//        将栈中的内容转化成优化后的路径
         let res = pathStack.reduce("") { total, dir in "\(total)/\(dir)" }
        // 注意空路径的结果是 "/"
        return res.isEmpty ? "/" : res
    }
    
}
