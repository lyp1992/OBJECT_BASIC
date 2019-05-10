//
//  OnNextViewController.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2018/12/28.
//  Copyright © 2018年 LYP. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OnNextViewController: UIViewController {

    var bag: DisposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
      
        let just0 = Observable.just("hello world")
        just0.subscribe({(event : Event<String>) in
            print(event)
        }).disposed(by: bag)
        print("----------------")
        
        let ofo = Observable.of("1","2","3")
        ofo.subscribe({(event:Event<String>) in
            print(event)
        }).disposed(by: bag)
        print("----------------")
        
        let array = [1,2,3,4,5]
        let fromo = Observable.from(array)
        fromo.subscribe({(event:Event<Int>) in
            print(event)
        }).disposed(by: bag)
        
         print("----------------")
        
        let  createOb = createObserable()
        createOb.subscribe({(event:Event<Any>) in
            print(event)
        }).disposed(by: bag)
        
        print("----------------")
        
        let obserableE = myJustObserable(element : "hello swift")
//
        obserableE.subscribe({(event : Event<String>) in
            print(event)
        }).disposed(by: bag)
//        obserableE.subscribe { (event : Event<String>) in
//                            print(event)
//            }.disposed(by: bag)
    }
}

extension OnNextViewController {
    
    fileprivate func createObserable() ->Observable<Any>{
        return Observable.create({ (obserable : AnyObserver<Any>) -> Disposable in
            
            obserable.onNext("hello world")
            obserable.onCompleted()
            
            return Disposables.create()
        })
    }
    
//   传参
    fileprivate func myJustObserable(element: String) -> Observable<String>{
       
        return Observable.create({(obserable : AnyObserver<String>) -> Disposable in
            obserable.onNext(element)
            obserable.onCompleted()
            
            return Disposables.create()
        })
    }
    
}
