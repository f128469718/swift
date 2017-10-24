//
//  ScoresScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/8.
//  Copyright © 2017年 admin. All rights reserved.
//


import Foundation

import SpriteKit
import GameplayKit
import UIKit



class ScoresScene: SKScene,UITableViewDelegate, UITableViewDataSource {
    
    
    var gameTableView = UITableView()
    
    override func didMove(to view: SKView) {
       
        self.gameTableView.delegate = self
        self.gameTableView.dataSource = self
        
        
        
        let cell = UINib(nibName: "CustomTableCell", bundle: nil)
        self.gameTableView.register(cell, forCellReuseIdentifier: "cell")
        self.gameTableView.frame = CGRect(x:20,y:50,width:280,height:200)
        //gameTableView.backgroundColor = UIColor.clear
        
        self.gameTableView.reloadData()
        
        view.addSubview(gameTableView)
        
        
        
    }
 
    
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //欄位數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8//emptyString.value1.count
    }
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.gameTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableCell
        
        cell.numberlabel.text = indexPath.row.description
        
        
        return cell
        
    }
    
    
    
    //標題欄位
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "title"
    }
    
    //選擇到的欄位
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        
        
        
        
    }
}

