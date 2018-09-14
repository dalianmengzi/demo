//
//  discussCell.swift
//  demo
//
//  Created by 尤增强 on 2018/9/14.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit

class discussCell: UITableViewCell {

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var text_label: UILabel!
    @IBOutlet weak var tableViewH: NSLayoutConstraint!
    var Section:MySection?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    func setTableview(m:MySection){
        self.text_label.text = m.header
        self.tableViewH.constant = 200
        self.Section = m
        self.tableview.register(UINib.init(nibName: "commentsCell", bundle: nil), forCellReuseIdentifier: "commentsCell")
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.estimatedRowHeight = 60
        self.tableview.rowHeight = UITableViewAutomaticDimension
       
        self.tableview.tableFooterView = UIView.init(frame: CGRect.zero)
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension discussCell:UITableViewDelegate,UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if let c = self.Section?.items.count{
            count = c > 5 ? 5 : c
        }

        return count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:commentsCell = tableview.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath) as! commentsCell
        cell.commentsText.text = self.Section?.items[indexPath.row]
        return cell
    }

}
