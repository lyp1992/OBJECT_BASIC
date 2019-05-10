//
//  ViewController.swift
//  RxSwift
//
//  Created by 赖永鹏 on 2018/12/28.
//  Copyright © 2018年 LYP. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var buttcon2: UIButton!
    @IBOutlet weak var textF2: UITextField!
    @IBOutlet weak var textF1: UITextField!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label2: UILabel!
    
    fileprivate lazy var bag: DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        button1.rx.tap.subscribe{ (event : Event<()>) in
            print("点击了button1")
        }.disposed(by: bag)
        
        button1.rx.tap.subscribe{ (event : Event<()>) in
            print("点击了button2")
        }.disposed(by: bag)
        textF1.rx.text.bind(to:label1.rx.text).disposed(by:bag)
        textF2.rx.text.bind(to:label2.rx.text).disposed(by:bag)
        
        label1.rx.observe(String.self, "text").subscribe({( str :Event<String?>) in
            print(str)
        }).disposed(by: bag)
        label2.rx.observe(String.self, "text").subscribe({(str : Event<String?> ) in
            print(str)
        }).disposed(by: bag)
        
        scrollView.contentSize = CGSize(width: 1000, height: 0)
        scrollView.rx.contentOffset.subscribe({(point:Event<CGPoint>) in
            print(point)
        }).disposed(by: bag)
        
    }

}

