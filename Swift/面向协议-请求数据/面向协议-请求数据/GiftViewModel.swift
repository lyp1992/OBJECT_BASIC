//
//  GiftViewModel.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class GiftViewModel: NSObject,Requestable {
    
    var urlString: String = "http://qf.56.com/pay/v4/giftList.ios"
    
    var type: MethodType = .get
    
    var paramester: [String : Any] = ["type" : 0, "page" : 1, "rows" : 150]
 
    lazy var pageAges : [GiftPackage] = [GiftPackage]()
}

extension GiftViewModel {
    
    func parseData(_ result: Any) {
        //            1.判断是否是一个字典
        guard let resultDic = result as? [String :Any] else {
            return
        }
        //            2.取出需要的数据
        guard let listArrayData = resultDic["message"] as? [String : Any] else {
            return
        }
        
        //            3.遍历字典
        for i in 0..<listArrayData.count {
            
            guard let typeDic = listArrayData["type\(i+1)"] as? [String : Any]else{
                continue
            }
            self.pageAges.append(GiftPackage(dict: typeDic))
            
        }
        
        //            4.取出数据
        self.pageAges = self.pageAges.filter({ $0.t != 0 }).sorted(by: { $0.t > $1.t})
    }
}
