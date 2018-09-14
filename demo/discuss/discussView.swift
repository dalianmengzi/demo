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

    //初始化数据
    var sections = [
        MySection(header: "<li data-replyid='lv4kabao56bfkr-8bq6spa'><div class='np-question-reply-users'><a href='javascript:;' class='np-question-reply-user replyofreply' datauserid='fwonav2ni7zexp7iavcvqq_yzq' data-displayname='尤增强'>尤增强</a></div> <div class='np-question-reply-detail'><div class='ErichText'>UILable的用法UIILable的用法UIILableUILable的用法UIILable的用法UIILableUILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法 比比画画 </div></div></li>", items: [
            "UILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UIILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法UILable的用法",
            "UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法UIText的用法",
            "UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法UIUIButton的用法UIButton的用法UIButton的用法UIButton的用法Button的用法UIButton的用法","we"
            ]),
        MySection(header: "高级控UIButton的用法UIButton的用法UIButton的用法UIButton的用法件", items: [
            "UITableViUIButton的用法UIButton的用法UIButton的用法UIButton的用法UIButton的用法ew的用法","12",
            "UICollectioUIButton的用法UIButton的用法UIButton的用法UIButton的用法nViews的用法","UICollectioUIButton的用法UIButton的","UICollectioUIButton的用法UIButton的","UICollectioUIButton的用法UIButton的","UICollectioUIButton的用法UIButton的"
            ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }


    private func setup() {


        self.tableview.register(UINib.init(nibName: "discussCell", bundle: nil), forCellReuseIdentifier: "discussCell")
        tableview.estimatedRowHeight = 179
        tableview.rowHeight = UITableViewAutomaticDimension

        tableview.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
        tableview.separatorStyle = .none
        tableview.delegate = self
        tableview.dataSource = self

    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension discussView : UITableViewDelegate ,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:discussCell = tableView.dequeueReusableCell(withIdentifier: "discussCell", for: indexPath) as! discussCell

        cell.setTableview(m: self.sections[indexPath.row])
        return cell
    }

     func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
          print("+++++++++++++++++++++++++++++2")
        return self.sections.count
    }

     func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as discussCell = cell else {
            return
        }

          print("+++++++++++++++++++++++++++++3")
        cell.backgroundColor = .clear


    }

    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


    }

}

extension String{
//funcstringHeightWith

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


