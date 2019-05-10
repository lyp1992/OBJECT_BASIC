//
//  TableWithCollectVC.swift
//  LoadXibFromView
//
//  Created by 赖永鹏 on 2019/1/4.
//  Copyright © 2019年 LYP. All rights reserved.
//

import UIKit

class TableWithCollectVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        创建
        let tableView = UITableView()
        tableView.frame = view.bounds
        tableView.dataSource = self
        
        tableView.registerCell(cell: CodeViewCell.self)
        view.addSubview(tableView)
    }

}

extension TableWithCollectVC:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(for: indexPath) as CodeViewCell
        cell.textLabel?.text = "testData :\(indexPath.row)"
        
        return cell
    }

}
