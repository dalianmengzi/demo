//
//  demoFoldingCell.swift
//  demo
//
//  Created by 尤增强 on 2018/9/13.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit
import FoldingCell
class demoFoldingCell: FoldingCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}
