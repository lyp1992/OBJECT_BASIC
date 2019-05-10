//
//  IMServerManager.swift
//  IMServer
//
//  Created by seemygo on 17/4/16.
//  Copyright © 2017年 seemygo. All rights reserved.
//
/*
 1> 创建Socket
 2> 绑定端口
 3> 监听listen
 4> 接受客户端的链接(accept) socket
    * 阻塞式的函数
 */

import Cocoa

class IMServerManager: NSObject {
    fileprivate lazy var tcpServer : TCPServer = TCPServer(addr: "0.0.0.0", port: 2828)
    fileprivate lazy var clients : [IMClient] = [IMClient]()
}

extension IMServerManager {
    func startRunning() {
        // 1.监听客户端的链接
        tcpServer.listen()
        
        // 2.接受客户端的链接
        DispatchQueue.global().async {
            while true {
                if let tcpClient = self.tcpServer.accept() {
                    DispatchQueue.global().async {
                        self.handleClient(tcpClient)
                    }
                }
            }
        }
    }
    
    func stopRunning() {
        
    }
}

extension IMServerManager {
    fileprivate func handleClient(_ client : TCPClient) {
        let client = IMClient(client: client)
        clients.append(client)
        
        client.callback = {[unowned self] (isLeave, data, client) in
            // 1.是否需要移动客户端
            if isLeave {
                if let index = self.clients.index(of: client) {
                    self.clients.remove(at: index)
                    client.tcpClient.close()
                }
            }
            
            // 2.将消息转发出去
            for c in self.clients {
                c.tcpClient.send(data: data)
            }
        }
        
        client.removeClientCallback = {[unowned self] (client) in
            if let index = self.clients.index(of: client) {
                self.clients.remove(at: index)
                client.tcpClient.close()
            }
        }
        
        client.startReadMessage()
    }
}
