//
//  ViewController.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class DataEntryTF: UITextField,shakeAble {
}
class AccountTextF: UITextField,Flashable {
}

class loginButton: UIButton,shakeAble {
}

class ViewController: UIViewController {

    @IBOutlet weak var accountTF: AccountTextF!
    @IBOutlet weak var passwordTF: DataEntryTF!
    
    @IBOutlet weak var loginBtn: loginButton!
    
    @IBAction func login(_ sender: Any) {
        
        loginBtn.shakeing()
        accountTF.flashing()
        passwordTF.shakeing()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstV : FirstView = FirstView.loadXibFromView()
//        view.addSubview(firstV)
        
//        let secVC : SecondView = SecondView.loadXibFromView(nibName: "SecondView")
        let secVC : SecondView = SecondView.loadXibFromView()
        print(secVC.frame.size.width)
        secVC.frame = CGRect(x: 0, y: firstV.frame.size.height, width: secVC.frame.size.width, height: secVC.frame.size.height)
//        view.addSubview(secVC)
        
        
    }


}

