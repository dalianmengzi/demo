//
//  sectionView.swift
//  demo
//
//  Created by 尤增强 on 2018/9/13.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit

class sectionView: UIView {

    @IBOutlet weak var textLabel: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override init(frame: CGRect) {
        super.init(frame: frame)
         awakeFromNib()

        var strHtml = "<html><body> Hello <span style=\"color:#0f0;font-size:30px;\">It is me.</span>"
        strHtml += "<br/>  <font size=\"13\" color=\"red\">Here you are, Here we are!</font>;</body></html>";

        let label:UILabel = UILabel()
        label.text = strHtml.html2String
        label.attributedText = strHtml.loadHtml()
        label.numberOfLines = 0 //Line break when the current line is full display.
        label.lineBreakMode = NSLineBreakMode.byClipping;//Tips:Supported six types.



        label.frame = CGRect(x:self.frame.origin.x,
                             y:self.frame.origin.y,
                             width:400,
                             height:100);
        self.addSubview(label)


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        let subView : UIView = Bundle.main.loadNibNamed("sectionView", owner: self, options: nil)?.first as! UIView
        subView.frame = self.frame
        self.addSubview(subView)

    }

}

extension String {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!,
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}
