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

var returnPress1 : UIButton!
var invitefriendsbutton : UIButton!
var ConfirmFriendsbutton : UIButton!
var Messagesbutton :UIButton!

class FriendsScene: SKScene {
    var sView : SKView?
    
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = pos.imageclass(image: "background-18", x: size.width/2, y: size.height/2,z:-1)
        let friends = pos.imageclass(image: "friends", x: size.width/1.12, y: size.height/1.7,z:0)
        
        invitefriendsbutton = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        invitefriendsbutton.setBackgroundImage(UIImage(named: "invitefriends"), for: UIControlState.normal)
        invitefriendsbutton.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        ConfirmFriendsbutton = UIButton(frame:CGRect(x: 70, y: 245, width: 220, height: 80))
        ConfirmFriendsbutton.setBackgroundImage(UIImage(named: "ConfirmFriends"), for: UIControlState.normal)
        ConfirmFriendsbutton.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
        
        Messagesbutton = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Messagesbutton.setBackgroundImage(UIImage(named: "Messages"), for: UIControlState.normal)
        Messagesbutton.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節
        
        returnPress1 = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress1.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress1.addTarget(self,action: #selector(clickButton3),for: .touchUpInside)//修改按鈕細節
        
        view.addSubview(invitefriendsbutton)
        view.addSubview(ConfirmFriendsbutton)
        view.addSubview(returnPress1)
        view.addSubview(Messagesbutton)

        addChild(background);addChild(friends)
        
        
        
        returnPress1.translatesAutoresizingMaskIntoConstraints = false
        invitefriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        ConfirmFriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        Messagesbutton.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: invitefriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: ConfirmFriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.66, bottomValue: -(view.bounds.height * 0.34), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: Messagesbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.74, rightValue: -(view.bounds.width * 0.26), widthValue: 0.27, heightValue: 0.18)
        
        pos.autoPosition(item1: returnPress1, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
       
       
        
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    @objc func clickButton1(sender:UIButton){
        
    }
    @objc func clickButton2(sender:UIButton){
        
    }
    @objc func clickButton3(sender:UIButton){
        
    }
}
