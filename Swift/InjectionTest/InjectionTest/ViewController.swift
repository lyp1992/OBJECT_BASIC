//
//  ViewController.swift
//  InjectionTest
//
//  Created by 赖永鹏 on 2019/4/8.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = createBtn()
        self.view.addSubview(button)
        
        
    }
    
    func createBtn() -> UIButton {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.backgroundColor = UIColor.red
        
        return button
    }

    @objc func injected() {
       viewDidLoad()
    }

}

