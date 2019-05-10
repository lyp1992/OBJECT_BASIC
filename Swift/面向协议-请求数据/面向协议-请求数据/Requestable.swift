//
//  Requestable.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}
protocol  Requestable{
    var urlString : String {get}
    var type :  MethodType {get}
    var paramester : [String : Any] { get }
    
    func parseData(_ result : Any)
}

extension Requestable {
    
    func  requestData(_ finishedCallback : @escaping() -> Void) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters:paramester).responseJSON { (response : DataResponse<Any>) in
//            1.判断是否有错误
            if let error = response.result.error {
                print("网络请求有错误:", error)
                return
            }
//            2. 获取结果
            guard let result = response.result.value else {
                return
            }
//            3. 解析数据
            self.parseData(result)
//            4. 告知外部数据请求完成
            finishedCallback()
        }
        
    }
}
