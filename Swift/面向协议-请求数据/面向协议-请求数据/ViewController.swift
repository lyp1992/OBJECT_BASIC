//
//  ViewController.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    fileprivate lazy var giftPackages : [GiftPackage] = []
//
    
    fileprivate lazy var giftVM : GiftViewModel = GiftViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        giftVM.requestData {
            print(self.giftVM.pageAges.count)
        }
        
//        NetWorkTool.requestData(urlString: "http://qf.56.com/pay/v4/giftList.ios", type: .get, parameters: ["type" : 0, "page" : 1, "rows" : 150]) { (result) in
//
////            1.判断是否是一个字典
//            guard let resultDic = result as? [String :Any] else {
//                return
//            }
////            2.取出需要的数据
//            guard let listArrayData = resultDic["message"] as? [String : Any] else {
//                return
//            }
//
////            3.遍历字典
//            for i in 0..<listArrayData.count {
//
//                guard let typeDic = listArrayData["type\(i+1)"] as? [String : Any]else{
//                    continue
//                }
//                self.giftPackages.append(GiftPackage(dict: typeDic))
//
//            }
//
////            4.取出数据
//            self.giftPackages = self.giftPackages.filter({ $0.t != 0 }).sorted(by: { $0.t > $1.t})
//        }
//
    }

}

