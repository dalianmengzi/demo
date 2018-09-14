//
//  commentsCell.swift
//  demo
//
//  Created by 尤增强 on 2018/9/14.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit

class commentsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor =  UIColor.clear
        // Initialization code
    }

    @IBOutlet weak var commentsText: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
