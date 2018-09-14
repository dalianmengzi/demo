//
//  discussView.swift
//  demo
//
//  Created by 尤增强 on 2018/9/13.
//  Copyright © 2018年 zqyou. All rights reserved.
//

import UIKit

class discussView: UIViewController {


    @IBOutlet weak var tableview: UITableView!
    var sectionsH  = [CGFloat.init(40)]
    //初始化数据
    let sections = [
        MySection(header: "<li data-replyid='lv4kabao56bfkr-8bq6spa'><div class='np-question-reply-users'><a href='javascript:;' class='np-question-reply-user replyofreply' datauserid='fwonav2ni7zexp7iavcvqq_yzq' data-displayname='尤增强'>尤增强</a></div> <div class='np-question-reply-detail'><div class='ErichText'> 比比画画 </div></div></li>", items: [
            "UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法",
            "UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法",
            "UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIUIButton的用法UIButton的用法UIButton的用法UIButton的用法Button的用法UIButton的用法","we"
            ]),
        MySection(header: "高级控UIButton的用法UIButton的用法UIButton的用法UIButton的用法件", items: [
            "UITableViUIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法ew的用法","12",
            "UICollectioUIButton的用法UIButton的用法UIButton的用法UIButton的用法nViews的用法"
            ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableview()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setTableview(){

        //创建一个重用的单元格
        self.tableview.register(UINib.init(nibName: "discussCell", bundle: nil), forCellReuseIdentifier: "discussCell")

        // 设置分割线的样式为None.
        self.tableview.separatorStyle = UITableViewCellSeparatorStyle.none

        self.tableview.delegate = self
        self.tableview.dataSource = self
        //设置estimatedRowHeight属性默认值
        self.tableview.estimatedRowHeight = 44.0;
        //rowHeight属性设置为UITableViewAutomaticDimension
        self.tableview.rowHeight = UITableViewAutomaticDimension;

        self.tableview.tableFooterView = UIView(frame:CGRect.zero)//除去多余的cell

    }
}

//自定义Section
struct MySection {
    var header: String
    var items: [String]

    init(header: String, items: [String]) {
        self.header = header
        self.items = items
    }
}



//tableView代理实现
extension discussView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :discussCell = tableview.dequeueReusableCell(withIdentifier: "discussCell", for: indexPath) as! discussCell
        cell.lable_text.text = sections[indexPath.section].items[indexPath.row]
        return cell
    }


    //返回分区头部视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int)
        -> UIView? {

             let sect : sectionView = sectionView()


            sect.textLabel.backgroundColor = UIColor.red
//            sect.loadhtml(text: self.sections[section].header)
            return sect
    }


//    //返回分区头部高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)
        -> CGFloat {
//            let f = sections[section].header.stringHeightWith(fontSize:18,width:self.tableview.frame.width)

            return   800
    }


}

extension String{

    //MARK:获得string内容高度

    func stringHeightWith(fontSize:CGFloat,width:CGFloat)->CGFloat{

        let font = UIFont.systemFont(ofSize: fontSize)

        let size = CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude)

        let paragraphStyle = NSMutableParagraphStyle()

        paragraphStyle.lineBreakMode = .byWordWrapping;

        let attributes = [NSAttributedStringKey.font:font, NSAttributedStringKey.paragraphStyle:paragraphStyle.copy()]

        let text = self as NSString

        let rect = text.boundingRect(with: size, options:.usesLineFragmentOrigin, attributes: attributes, context:nil)

        return rect.size.height

    }//funcstringHeightWith

    //加载html
    func loadHtml() -> NSAttributedString{

        let textHtml = try! NSAttributedString(
            data:self.data(using: String.Encoding(rawValue: String.Encoding.unicode.rawValue), allowLossyConversion: true)!,
            options:[NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)

        return textHtml
    }

    //加载html
    func loadHtmlH() -> CGFloat{

        let textHtml = try! NSAttributedString(
            data:self.data(using: String.Encoding(rawValue: String.Encoding.unicode.rawValue), allowLossyConversion: true)!,
            options:[NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)

        return  textHtml.size().height
    }


}//extension end

