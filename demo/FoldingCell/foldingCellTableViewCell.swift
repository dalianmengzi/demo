//
//  foldingCellTableViewCell.swift
//  demo
//
//  Created by 尤增强 on 2018/9/12.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit
import FoldingCell
class foldingCellTableViewCell: FoldingCell {

    
    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()

    }
    @IBAction func actionBtn1(_ sender: UIButton) {
        print("11")
    }

    @IBAction func actionBtn2(_ sender: UIButton) {
         print("11")
    }
    @IBOutlet weak var actionBtn3: UIButton!
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}
