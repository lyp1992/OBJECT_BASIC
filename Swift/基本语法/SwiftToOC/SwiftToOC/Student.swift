//
//  Student.swift
//  SwiftToOC
//
//  Created by 赖永鹏 on 2019/8/28.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

@objcMembers class Student: Person {

    @objc dynamic var weight: Int = 0
    var observe:Observer = Observer()
    override init() {
        super.init()
        addObserver(observe, forKeyPath: "weight", options: [.new,.old], context: nil)
    }
    deinit {
        removeObserver(observe, forKeyPath: "weight")
    }
}
