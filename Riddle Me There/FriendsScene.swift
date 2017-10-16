//
//  FriendsScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit
import UIKit



class FriendsScene: SKScene {
    var sView : SKView?
    
    var returnbtn : UIButton!
    var invitefriendsbutton : UIButton!
    var ConfirmFriendsbutton : UIButton!
    var Messagesbutton :UIButton!
    
    var gameTableView = ShowTableview2()
    
    var friendsData = [FriendsData]()
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background image
        let background = pos.imageclass(image: "background-18", x: size.width/2, y: size.height/2,z:-1)
         background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        // friends text image
        let friends = pos.imageclass(image: "friends", x: size.width/1.12, y: size.height/1.7,z:0)
        
        // invite friends button
        invitefriendsbutton = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        invitefriendsbutton.setBackgroundImage(UIImage(named: "invitefriends"), for: UIControlState.normal)
        invitefriendsbutton.addTarget(self,action: #selector(invitefriendsbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // Confirm Friends button
        ConfirmFriendsbutton = UIButton(frame:CGRect(x: 70, y: 245, width: 220, height: 80))
        ConfirmFriendsbutton.setBackgroundImage(UIImage(named: "ConfirmFriends"), for: UIControlState.normal)
        ConfirmFriendsbutton.addTarget(self,action: #selector(ConfirmFriendsbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // Messages button
        Messagesbutton = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Messagesbutton.setBackgroundImage(UIImage(named: "Messages"), for: UIControlState.normal)
        Messagesbutton.addTarget(self,action: #selector(Messagesbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // return button
        returnbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        //tableview
        var postdata = "email=\(account)"
        var friendjson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchfriends.php", valuedata: postdata)
        gameTableView.sView = sView!
        gameTableView.title = "Friends"
        
        
        var jsoncount = friendjson.count
        
        for jsonIndex in 0 ..< jsoncount{
            let fridata = FriendsData()
            fridata.friends = friendjson[jsonIndex]["friend"] as! String
            
            self.friendsData.append(fridata)
        }
        
        
        for index in 0 ..< self.friendsData.count {
            gameTableView.items.append(self.friendsData[index].friends)
        }

        //gameTableView.items = emptyString.value1
        
        gameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        gameTableView.frame=CGRect(x:20,y:50,width:280,height:200)
        gameTableView.backgroundColor = UIColor.clear
        
        gameTableView.reloadData()
        
        // add view
        sView?.addSubview(invitefriendsbutton)
        sView?.addSubview(ConfirmFriendsbutton)
        sView?.addSubview(returnbtn)
        sView?.addSubview(Messagesbutton)
        sView?.addSubview(gameTableView)
        
        addChild(background)
        addChild(friends)
        
        
        // close auto layout
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        invitefriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        ConfirmFriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        Messagesbutton.translatesAutoresizingMaskIntoConstraints = false
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // set auto layout
        pos.autoPosition(item1: invitefriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: ConfirmFriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.66, bottomValue: -(view.bounds.height * 0.34), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: Messagesbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.74, rightValue: -(view.bounds.width * 0.26), widthValue: 0.27, heightValue: 0.18)
        
        pos.autoPosition(item1: returnbtn, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: gameTableView, item2: sView!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.26, rightValue: -(view.bounds.width * 0.74), widthValue: 0.4, heightValue: 0.8)
        
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        if (gameTableView.value == "true") {
            print("update")
            //tableview
            var postdata = "email=andy@gmail.com"
            let friendjson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchfriends.php", valuedata: postdata)
            
            var jsoncount = friendjson.count
            
            for jsonIndex in 0 ..< jsoncount{
                var frienddata = FriendsData()
                frienddata.friends = friendjson[jsonIndex]["value"] as! String
                
                self.friendsData.append(frienddata)
            }
            
            for index in 0 ..< self.friendsData.count {
                gameTableView.items.append(self.friendsData[index].friends)
            }
            
            gameTableView.reloadData()
            gameTableView.value = ""
            
        }
    }
    
    // invite friends button event
    @objc func invitefriendsbtnevent(sender:UIButton){
        
    }
    
    // Confirm Friends button event
    @objc func ConfirmFriendsbtnevent(sender:UIButton){
        
    }
    
    // Messages button event
    @objc func Messagesbtnevent(sender:UIButton){
        
    }
    
    // return button event
    @objc func returnbtnevent(sender:UIButton){
        
    }
}

