//
//  InviteReward.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit

class InviteFriendScene: SKScene {
    
    var sView: SKView?
    
    var FriendText : SKLabelNode!
    
    var sendButton : UIButton!
    var returnbtn : UIButton!
    var Friendbutton : UIButton!
    var invitefriendsbutton : UIButton!
    var ConfirmFriendsbutton : UIButton!
    var Messagesbutton :UIButton!
    
    var friendText : UITextField!
    
    override func didMove(to view: SKView) {
        
        sView = self.view
        
        let background = SKSpriteNode(imageNamed: "background-18")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        FriendText = SKLabelNode(text: "Friend Name")
        FriendText.position = CGPoint(x: (sView?.bounds.size.width)!/2, y: (sView?.bounds.size.height)!/1.5)
        FriendText.fontSize = 45
        FriendText.fontName = "AvenirNext-Bold"
        addChild(FriendText)
        
        
        // send Button
        sendButton = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        sendButton.setBackgroundImage(UIImage(named: "send0"), for: UIControlState.normal)
        sendButton.addTarget(self,action: #selector(sendButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(sendButton)
        
        // Friend button
        Friendbutton = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        Friendbutton.setBackgroundImage(UIImage(named: "friends"), for: UIControlState.normal)
        Friendbutton.addTarget(self,action: #selector(Friendbuttonevnet),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(Friendbutton)
        
        // invite friends button
        invitefriendsbutton = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        invitefriendsbutton.setBackgroundImage(UIImage(named: "invitefriends"), for: UIControlState.normal)
        invitefriendsbutton.addTarget(self,action: #selector(invitefriendsbtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(invitefriendsbutton)
        
        // Confirm Friends button
        ConfirmFriendsbutton = UIButton(frame:CGRect(x: 70, y: 245, width: 220, height: 80))
        ConfirmFriendsbutton.setBackgroundImage(UIImage(named: "ConfirmFriends"), for: UIControlState.normal)
        ConfirmFriendsbutton.addTarget(self,action: #selector(ConfirmFriendsbtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(ConfirmFriendsbutton)
        
        // Messages button
        Messagesbutton = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Messagesbutton.setBackgroundImage(UIImage(named: "Messages"), for: UIControlState.normal)
        Messagesbutton.addTarget(self,action: #selector(Messagesbtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(Messagesbutton)
        
        // return button
        returnbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(returnbtn)
        
        
        friendText = UIdesign().textfiled(x: (sView?.bounds.width)!*0.35, y: (sView?.bounds.height)! * 0.44, width: (sView?.bounds.width)!*0.3, height: 18, text: "", level: 1)
        sView?.addSubview(friendText)
        
        
        
        // close auto layout
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        Friendbutton.translatesAutoresizingMaskIntoConstraints = false
        invitefriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        ConfirmFriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        Messagesbutton.translatesAutoresizingMaskIntoConstraints = false

        
        
        // set auto layout
         pos.autoPosition(item1: sendButton, item2: self.view!, topValue: view.bounds.height * 0.6, bottomValue: -(view.bounds.height * 0.4), leftValue: view.bounds.width * 0.4, rightValue: -(view.bounds.width * 0.6), widthValue: 0.18, heightValue: 0.08)
        
        pos.autoPosition(item1: Friendbutton, item2: self.view!, topValue: view.bounds.height * 0.35, bottomValue: -(view.bounds.height * 0.65), leftValue: view.bounds.width * 0.79, rightValue: -(view.bounds.width * 0.21), widthValue: 0.2, heightValue: 0.12)
        
        pos.autoPosition(item1: invitefriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: ConfirmFriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.66, bottomValue: -(view.bounds.height * 0.34), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: Messagesbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.74, rightValue: -(view.bounds.width * 0.26), widthValue: 0.27, heightValue: 0.18)
        
        pos.autoPosition(item1: returnbtn, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
    }
    
    // Friend button event
    @objc func sendButtonevent(sender:UIButton){
        
    }
    
    // Friend button event
    @objc func Friendbuttonevnet(sender:UIButton){
        
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

