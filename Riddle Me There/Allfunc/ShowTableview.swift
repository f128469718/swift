//
//  ShowTableview.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit

class ShowTableview: UITableView,UITableViewDelegate,UITableViewDataSource {
    
     var items: [String] = ["Player1", "Player2", "Player3"]
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        // MARK: - Table view data source
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
        //欄位數
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        //欄位的內容
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
            
            //欄位背景透明化
            cell.backgroundColor = UIColor.clear
            
            //將陣列面的值插入到tableview的欄位裡
            cell.textLabel?.text = self.items[indexPath.row]
            
            //cell.layer.backgroundColor = UIColor.clear.cgColor
            //cell.contentView.backgroundColor = UIColor.clear
            
            return cell
        }
    
        //標題欄位
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return "Test"
        }
    
        //選擇到的欄位
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You selected cell #\(indexPath.row)!")
        }
    
    
}

