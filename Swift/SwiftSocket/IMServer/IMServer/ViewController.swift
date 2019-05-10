//
//  ViewController.swift
//  IMServer
//
//  Created by seemygo on 17/4/16.
//  Copyright © 2017年 seemygo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var hintLabel: NSTextField!
    fileprivate lazy var serverMgr : IMServerManager = IMServerManager()
    
    @IBAction func startRunning(_ sender: NSButton) {
        hintLabel.stringValue = "服务器已经启动ing"
        serverMgr.startRunning()
    }
    
    @IBAction func stopRunning(_ sender: NSButton) {
        hintLabel.stringValue = "服务器未启动"
        serverMgr.stopRunning()
    }
}

