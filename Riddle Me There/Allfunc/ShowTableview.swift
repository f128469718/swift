//
//  ShowTableview.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class ShowTableview: UITableView,UITableViewDelegate,UITableViewDataSource {
    var title = ""
    var items: [String] = []
    var items2: [String] = []
    var items3: [String] = []
    var items4: [String] = []
    var vWidth : CGFloat = 0.0
    var vHeight : CGFloat = 0.0
    var sView = UIView()
    var myUIView = UIView()
    var myImage = UIImageView()
    var likelabel = UILabel()
    var dislikelabel = UILabel()
    var returnbtn = UIButton()
    
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
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //設定子畫面
        myUIView.frame = CGRect(x: vWidth * 0.25 , y: vHeight * 0.25 , width: vWidth * 0.5, height:  vHeight * 0.5)
        myUIView.backgroundColor = UIColor.darkGray
        
        //設定子畫面圖片
        myImage = UIImageView(image: UIImage(named: "like dislike icon"))
        myImage.frame = CGRect(x: myUIView.bounds.width * 0.3, y: myUIView.bounds.height * 0.25, width: myUIView.bounds.width * 0.3, height: myUIView.bounds.width * 0.3)
        
        //設定子畫面文字
        likelabel = UILabel(frame: CGRect(x: myUIView.bounds.width * 0.5, y: myUIView.bounds.height * 0.25, width: 40, height: 40))
        
        dislikelabel = UILabel(frame: CGRect(x: myUIView.bounds.width * 0.5, y: myUIView.bounds.height * 0.55, width: 40, height: 40))
        
        //設定子畫面的返回鍵
        returnbtn = UIButton(frame: CGRect(x: myUIView.bounds.width - 80, y: myUIView.bounds.height - 80 , width: myUIView.bounds.width * 0.2, height: myUIView.bounds.height * 0.2))
        
        returnbtn.backgroundColor = UIColor.brown
        returnbtn.setTitle("return", for: .normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)
        
        //設定值為隱藏
        myUIView.isHidden = true
        myImage.isHidden = true
        likelabel.isHidden = true
        dislikelabel.isHidden = true
        returnbtn.isHidden = true
        
        //加入當前的母畫面
        myUIView.addSubview(myImage)
        myUIView.addSubview(likelabel)
        myUIView.addSubview(dislikelabel)
        myUIView.addSubview(returnbtn)
        sView.addSubview(myUIView)
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        //欄位背景透明化
        cell.backgroundColor = UIColor.clear
        
        //原本預設numberOfLines = 1 , 0可以設定無限行數
        cell.textLabel?.numberOfLines = 0
        
        //將陣列面的值插入到tableview的欄位裡
        cell.textLabel?.text = "Title : \(self.items[indexPath.row])\nRiddle :\(self.items2[indexPath.row])"
        cell.textLabel?.textAlignment = .justified
        //cell.textLabel?.frame = CGRect(x: 100, y: 30, width: 200, height: 50)
        
        //欄位前面的圖片
        var imageName = UIImage(named: "Select button icon")
        cell.imageView?.image = imageName
        
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        //cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    
    //標題欄位
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return title
    }
    
    //選擇到的欄位
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        hide()
        likelabel.text = self.items3[indexPath.row]
        dislikelabel.text = self.items4[indexPath.row]
        
    }
    func hide() {
        myUIView.isHidden = !myUIView.isHidden
        myImage.isHidden = !myImage.isHidden
        likelabel.isHidden = !likelabel.isHidden
        dislikelabel.isHidden = !dislikelabel.isHidden
        returnbtn.isHidden = !returnbtn.isHidden
    }
    
    @objc func returnbtnevent(sender:UIButton){
        print("Press")
        hide()
    }
    
}

class ShowTableview2: UITableView,UITableViewDelegate,UITableViewDataSource {
    var title = ""
    var items: [String] = []
    var items2: [String] = []
    var value = ""
    
    var sView = UIView()
    
    
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
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        //欄位背景透明化
        cell.backgroundColor = UIColor.clear
        
        //原本預設numberOfLines = 1 , 0可以設定無限行數
        cell.textLabel?.numberOfLines = 0
        
        //將陣列面的值插入到tableview的欄位裡
        cell.textLabel?.text = "Name : \(self.items[indexPath.row])"
        cell.textLabel?.textAlignment = .justified
        //cell.textLabel?.frame = CGRect(x: 100, y: 30, width: 200, height: 50)
        
        //欄位前面的圖片
        var imageName = UIImage(named: "Select button icon")
        cell.imageView?.image = imageName
        
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        //cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    
    //標題欄位
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return title
    }
    
    //選擇到的欄位
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        deleteAlert(name: self.items[indexPath.row])
        
        
        
    }
    
    func deleteAlert(name:String){
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "刪除好友",
            message: "確認要刪除了嗎？",
            preferredStyle: .alert)
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[刪除]按鈕
        let okAction = UIAlertAction(
            title: "刪除",
            style: .default,
            handler:  {(alert: UIAlertAction!) in self.abc(name:name)})
        alertController.addAction(okAction)
        
        // 顯示提示框
        sView.window?.rootViewController?.present(alertController, animated: true)
    }
    
    func abc(name:String) {
        var data = "email=andy@gmail.com&friendname=\(name)"
        //emptyString = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/deletefriends.php", valuedata: data, method: 2)
        //value = emptyString.value5
        
    }
}





