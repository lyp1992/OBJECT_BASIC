//
//  NetWorkTool.swift
//  面向协议-请求数据
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import Alamofire

//enum MethodType {
//    case get
//    case post
//}

class NetWorkTool : NSObject {
    
}

extension NetWorkTool {
    
//    class func requestData(urlString : String , type : MethodType , parameters : [String : Any],finishedCallBack : @escaping (Any) -> Void){
//
//        let  method = type == .get ? HTTPMethod.get : HTTPMethod.post
//        Alamofire.request(
//            urlString,
//            method: method,
//            parameters: parameters).responseJSON { (response : DataResponse<Any>) in
//
////                1.判断是否有误
//                if let error = response.result.error{
//                    print("网络请求有错误:", error)
//                    return
//                }
////                2.获取结果
//                guard let result = response.result.value else {
//                    return
//                }
////                3.将结果回调出去
//                finishedCallBack(result)
//        }
//
//
//    }
    
}
