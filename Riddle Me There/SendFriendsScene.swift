//
//  MessageScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
class SendFriendsScene : SKScene, UITableViewDelegate, UITableViewDataSource {
    var sView: SKView?
    
    var friendsTableView = UITableView()
    var title = "Frineds"
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = SKSpriteNode(imageNamed: "Background-7")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        self.friendsTableView.delegate = self
        self.friendsTableView.dataSource = self
        
        let cell = UINib(nibName: "FriendTableCell", bundle: nil)
        friendsTableView.register(cell, forCellReuseIdentifier: "cell")
        friendsTableView.frame = CGRect(x:20,y:50,width:280,height:200)
       
        friendsTableView.reloadData()
        sView?.addSubview(friendsTableView)
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //欄位數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5//emptyString.value1.count
    }
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.friendsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendTableCell
        
        cell.friendname.text = "20"
         cell.iconimg.image = UIImage(named: "arrow icon")
       
        return cell
        
    }
    
    
    
    //標題欄位
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return title
    }
    
    //選擇到的欄位
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        
        
        
        
    }
   
}

