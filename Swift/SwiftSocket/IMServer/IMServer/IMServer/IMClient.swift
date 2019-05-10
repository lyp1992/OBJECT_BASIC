//
//  IMClient.swift
//  IMServer
//
//  Created by seemygo on 17/4/22.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import Cocoa

class IMClient: NSObject {
    var tcpClient : TCPClient
    var callback : ((Bool, Data, IMClient) -> Void)?
    var removeClientCallback : ((IMClient) -> Void)?
    
    fileprivate var isRunning : Bool = false
    
    init(client : TCPClient) {
        self.tcpClient = client
    }
}

extension IMClient {
    func startReadMessage() {
        isRunning = true
        while isRunning {
            if let lengthByte = tcpClient.read(4) {
                // 1.获取数据的长度
                let lengthData = NSData(bytes: lengthByte, length: 4)
                var length : Int = 0
                lengthData.getBytes(&length, length: 4)
                
                // 2.读取消息的类型
                guard let typeBytes = tcpClient.read(2) else {
                    tcpClient.read(length)
                    continue
                }
                let typeData = NSData(bytes: typeBytes, length: 2)
                var type : Int = 0
                typeData.getBytes(&type, length: 2)
                print(type)
                
                // 3.获取具体的内容
                guard let dataBytes = tcpClient.read(length) else {
                    return
                }
                let msgData = Data(bytes: dataBytes, count: length)
                
                // 1> 判断是否是离开消息: 告诉其他人, 有人离开房间, 将该客户端从数组中移除
                // 2> 其他消息, 直接转发给其他客户端
                let isLeave = type == 1 ? true : false
                callback?(isLeave, (lengthData as Data) + (typeData as Data) + msgData, self)
            } else {
                isRunning = false
                removeClientCallback?(self)
            }
        }
    }
}
