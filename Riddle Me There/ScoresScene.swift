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



class ScoresScene: SKScene, UITableViewDelegate, UITableViewDataSource {
    
    var sView : SKView?
    var Countrybtn : UIButton!
    var Globalbtn : UIButton!
    var Personalbtn : UIButton!
    var totalbtn : UIButton!
    var createdbtn : UIButton!
    var solvedbtn : UIButton!
    var returnbtn: UIButton!
    var gameTableView = UITableView()
    var title = "Score"
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background image
        let background = pos.imageclass(image: "background-9", x: size.width/2, y: size.height/2,z:-1)
        
        // view text image
        let viewtext = pos.imageclass(image: "VIEW", x: size.width/5.8, y: size.height/2.5,z:0)
        let reel = pos.imageclass(image: "reel-1", x: size.width/1.09, y: size.height/3.2,z:0)
        let friends = pos.imageclass(image: "friends", x: size.width/1.1, y: size.height/1.95,z:1)
        
        // return button
        returnbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        // Country button
        Countrybtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        Countrybtn.setBackgroundImage(UIImage(named: "country1"), for: UIControlState.normal)
        Countrybtn.addTarget(self,action: #selector(Countrybtnevent),for: .touchUpInside)//修改按鈕細節
        
        // Global button
        Globalbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        Globalbtn.setBackgroundImage(UIImage(named: "global"), for: UIControlState.normal)
        Globalbtn.addTarget(self,action: #selector(Globalbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // Personal button
        Personalbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        Personalbtn.setBackgroundImage(UIImage(named: "personal"), for: UIControlState.normal)
        Personalbtn.addTarget(self,action: #selector(Personalbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // total button
        totalbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        totalbtn.setBackgroundImage(UIImage(named: "total"), for: UIControlState.normal)
        totalbtn.addTarget(self,action: #selector(totalbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // created button
        createdbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        createdbtn.setBackgroundImage(UIImage(named: "created"), for: UIControlState.normal)
        createdbtn.addTarget(self,action: #selector(createdbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        // solved button
        solvedbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        solvedbtn.setBackgroundImage(UIImage(named: "solved"), for: UIControlState.normal)
        solvedbtn.addTarget(self,action: #selector(solvedbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        
        //tableview
        // var data = "email=andy@gmail.com&button=1"
        //emptyString = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/sortfriendscore.php", valuedata: data, method: 5)
        
        self.gameTableView.delegate = self
        self.gameTableView.dataSource = self
        
        
        
        let cell = UINib(nibName: "CustomTableCell", bundle: nil)
        gameTableView.register(cell, forCellReuseIdentifier: "cell")
        gameTableView.frame = CGRect(x:20,y:50,width:280,height:200)
        //gameTableView.backgroundColor = UIColor.clear
        
        gameTableView.reloadData()
        
        
        
        // add view
        addChild(background)
        addChild(viewtext)
        addChild(friends)
        addChild(reel)
        
        view.addSubview(returnbtn)
        view.addSubview(Countrybtn)
        view.addSubview(Globalbtn)
        view.addSubview(Personalbtn)
        view.addSubview(totalbtn)
        view.addSubview(createdbtn)
        view.addSubview(solvedbtn)
        view.addSubview(gameTableView)
        
        
        // close auto layout
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        Countrybtn.translatesAutoresizingMaskIntoConstraints = false
        Globalbtn.translatesAutoresizingMaskIntoConstraints = false
        Personalbtn.translatesAutoresizingMaskIntoConstraints = false
        totalbtn.translatesAutoresizingMaskIntoConstraints = false
        createdbtn.translatesAutoresizingMaskIntoConstraints = false
        solvedbtn.translatesAutoresizingMaskIntoConstraints = false
        //gameTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // set auto layout
        pos.autoPosition(item1: returnbtn, item2: self.view!, topValue: view.bounds.height * 0, bottomValue: -(view.bounds.height * 1), leftValue: view.bounds.width * 0, rightValue: -(view.bounds.width * 1), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: Countrybtn, item2: self.view!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.2, heightValue: 0.15)
        
        pos.autoPosition(item1: Globalbtn, item2: self.view!, topValue: view.bounds.height * 0.7, bottomValue: -(view.bounds.height * 0.3), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.2, heightValue: 0.13)
        
        pos.autoPosition(item1: Personalbtn, item2: self.view!, topValue: view.bounds.height * 0.78, bottomValue: -(view.bounds.height * 0.22), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.23, heightValue: 0.25)
        
        pos.autoPosition(item1: totalbtn, item2: self.view!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.09, rightValue: -(view.bounds.width * 0.91), widthValue: 0.14, heightValue: 0.11)
        
        pos.autoPosition(item1: createdbtn, item2: self.view!, topValue: view.bounds.height * 0.76, bottomValue: -(view.bounds.height * 0.24), leftValue: view.bounds.width * 0.05, rightValue: -(view.bounds.width * 0.95), widthValue: 0.18, heightValue: 0.1)
        
        pos.autoPosition(item1: solvedbtn, item2: self.view!, topValue: view.bounds.height * 0.85, bottomValue: -(view.bounds.height * 0.15), leftValue: view.bounds.width * 0.04, rightValue: -(view.bounds.width * 0.96), widthValue: 0.18, heightValue: 0.1)
        
        // pos.autoPosition(item1: gameTableView, item2: sView!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.26, rightValue: -(view.bounds.width * 0.74), widthValue: 0.4, heightValue: 0.8)
        
        
    }
    
    // return button event
    @objc func returnbtnevent(sender:UIButton){
        
    }
    
    // Country button event
    @objc func Countrybtnevent(sender:UIButton){
        
    }
    
    // Global button event
    @objc func Globalbtnevent(sender:UIButton){
        
    }
    
    // Personal button event
    @objc func Personalbtnevent(sender:UIButton){
        
    }
    
    // total button event
    @objc func totalbtnevent(sender:UIButton){
        
    }
    
    // created button event
    @objc func createdbtnevent(sender:UIButton){
        
    }
    
    // solved button event
    @objc func solvedbtnevent(sender:UIButton){
        
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //欄位數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1//emptyString.value1.count
    }
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.gameTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableCell
        
        /* cell.numberlabel.text = indexPath.row.description
         cell.namelabel.text = emptyString.value1[]*/
        
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

