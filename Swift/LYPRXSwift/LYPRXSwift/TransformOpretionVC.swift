//
//  TransformOpretionVC.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2019/1/3.
//  Copyright © 2019年 LYP. All rights reserved.
//

// 变换操作

import UIKit
import RxSwift

struct Student {
    var score : Variable<Double>
    
}

class TransformOpretionVC: UIViewController {

    fileprivate lazy var bag : DisposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        let array = [1,2,3,4]
        
        
        let array1 = array.map { (num : Int) -> Int in
            return num * num
        }
        print(array1)
        
        let array2 = array.map({ $0 * $0})
        print(array2)
        
        Observable.of(1,2,3,4).map({(num : Int) -> Int in
            return num * num
        }).subscribe({(event : Event<Int>) in
            print(event)
        }).disposed(by: bag)
        
        
//        flatMap的使用
        let stu1 = Student(score: Variable<Double>(80))
        let stu2 = Student(score: Variable(100))
        
        let studentVariable = Variable(stu1)
        
//        studentVariable.asObservable().flatMap { (stu : Student) -> Observable<Double> in
//            return stu.score.asObservable()
//            }.subscribe({(event : Event<Double>) in
//                print(event)
//            }).disposed(by: bag)
        
        studentVariable.asObservable().flatMapLatest { (stu : Student) -> Observable<Double> in
            return stu.score.asObservable()
            }.subscribe({(event : Event<Double>) in
              print(event)
            }).disposed(by: bag)
        
        studentVariable.value = stu2
        stu2.score.value = 0
        stu1.score.value = 1000
    }
}
