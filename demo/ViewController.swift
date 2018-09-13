//
//  ViewController.swift
//  demo
//
//  Created by 尤增强 on 2018/9/12.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!
    let data = Observable.just([
            Action.init(actionName: "FoldingCell", vc: foldingTableView())
        ])
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setTableView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController:UITableViewDelegate{


    func setTableView(){


        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //将数据源数据绑定到tableView上
        self.data
            .bind(to: tableView.rx.items(cellIdentifier:"Cell")) { _, action, cell in
                cell.textLabel?.text = action.actionName

            }.disposed(by: disposeBag)

        //tableView点击响应
        tableView.rx.modelSelected(Action.self).subscribe(onNext: { action in
             self.navigationController?.pushViewController(action.vc, animated: true)
        }).disposed(by: disposeBag)

        self.tableView.rx.setDelegate(self).disposed(by: disposeBag)
    }
}


struct Action {
    let actionName: String
    let vc: UIViewController

    init(actionName: String, vc: UIViewController) {
        self.actionName = actionName
        self.vc = vc
    }
}
