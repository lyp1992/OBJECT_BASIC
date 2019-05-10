//
//  ReleaseResourcesVC.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2019/1/3.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import RxSwift
class ReleaseResourcesVC: UIViewController {

    fileprivate lazy var bag : DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subject = BehaviorSubject(value: "a")
        subject.subscribe { (event : Event<String>) in
            print(event)
        }.disposed(by: bag)
        
        subject.onNext("b")
    }

}
