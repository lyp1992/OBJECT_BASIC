//
//  ViewController.swift
//  YPIMClient
//
//  Created by 赖永鹏 on 2019/1/8.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var ypSocket : YPSocket = YPSocket()
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        连接服务器
        if ypSocket.connect(){
            print("连接成功")
            ypSocket.delegate = self
            ypSocket.startReadMsg()
        }
        
    }

    @IBAction func enterRoom(_ sender: UIButton) {
        ypSocket.enterRoom()
    }
    
    @IBAction func leaveRoom(_ sender: Any) {
        
        ypSocket.leaveRoom()
        
    }
    @IBAction func startChat(_ sender: UIButton) {
        ypSocket.sendChatMessage("hello swift")
    }
    
    @IBAction func sendGiftMsg(_ sender: UIButton) {
        ypSocket.sendGiftMessage("money", "gift.url", "520", 1)
    }
    
}

extension ViewController : YPSocketDelegate{
    func ypSocket(_ ypSocket: YPSocket, enterRoom userInfo: UserInfo) {
        
    }
    func ypSocket(_ ypSocket: YPSocket, leaveRoom userInfo: UserInfo) {
        
    }
    func ypSocket(_ ypSocket: YPSocket, receiveMsg chatMessage: ChatMessage) {
        
    }
    func ypSocket(_ ypSocket: YPSocket, receiveGift giftMsg: GiftMessage) {
        
    }
    
}
