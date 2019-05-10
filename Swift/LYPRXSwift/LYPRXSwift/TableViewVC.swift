//
//  TableViewVC.swift
//  LYPRXSwift
//
//  Created by 赖永鹏 on 2019/1/3.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit
import RxSwift
class TableViewVC: UIViewController {

    fileprivate lazy var bag : DisposeBag = DisposeBag()
    fileprivate lazy var identify : String = "heroCellID"
    
    fileprivate lazy var tableView : UITableView = {
       
        let tableView = UITableView(frame: self.view.bounds)
        
        return tableView
    }()
    
//    创建viewModel
    let heroVM = HeroViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        view.addSubview(tableView)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identify)
        
        heroVM.heroObservable.asObservable().bind(to: tableView.rx.items(cellIdentifier: identify, cellType: UITableViewCell.self)) { row,hero,cell in
            cell.textLabel?.text = hero.name
            cell.detailTextLabel?.text = hero.intro
            cell.imageView?.image = UIImage(named: hero.icon)
            }.disposed(by: bag )
        
        tableView.rx.itemSelected.subscribe(onNext :{(indexPath) in
            print(indexPath)
        }).disposed(by: bag)
        tableView.rx.modelSelected(Hero.self).subscribe (onNext : { (hero : Hero) in
            print(hero.name)
        }).disposed(by: bag)
        
      tableView.rx.setDelegate(self).disposed(by: bag)
        
      
    }

}

extension TableViewVC : UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
