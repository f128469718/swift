//
//  MessageScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/18.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
class MessageScene : SKScene {
    var sView: SKView?
    
    var sendletterbtn : UIButton!
    var receivebtn : UIButton!
    
    var returnbtn : UIButton!
    var Friendbutton : UIButton!
    var invitefriendsbutton : UIButton!
    var ConfirmFriendsbutton : UIButton!
    var Messagesbutton :UIButton!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = SKSpriteNode(imageNamed: "background-18")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        
        // send letter button
        receivebtn = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        receivebtn.setBackgroundImage(UIImage(named: "receive 0"), for: UIControlState.normal)
        receivebtn.addTarget(self,action: #selector(receivebtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(receivebtn)
        
        
        // send letter button
        sendletterbtn = UIButton(frame:CGRect(x: 300, y: 150, width: 180, height: 50))
        sendletterbtn.setBackgroundImage(UIImage(named: "send 0"), for: UIControlState.normal)
        sendletterbtn.addTarget(self,action: #selector(sendletterbtnevnet),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(sendletterbtn)
        
        
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
        
        
        
        sendletterbtn.translatesAutoresizingMaskIntoConstraints = false
        receivebtn.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        Friendbutton.translatesAutoresizingMaskIntoConstraints = false
        invitefriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        ConfirmFriendsbutton.translatesAutoresizingMaskIntoConstraints = false
        Messagesbutton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // set auto layout
        
        pos.autoPosition(item1: sendletterbtn, item2: self.view!, topValue: view.bounds.height * 0.3, bottomValue: -(view.bounds.height * 0.7), leftValue: view.bounds.width * 0.3, rightValue: -(view.bounds.width * 0.7), widthValue: 0.4, heightValue: 0.12)
        
        pos.autoPosition(item1: receivebtn, item2: self.view!, topValue: view.bounds.height * 0.66, bottomValue: -(view.bounds.height * 0.34), leftValue: view.bounds.width * 0.24, rightValue: -(view.bounds.width * 0.76), widthValue: 0.4, heightValue: 0.12)
        
        pos.autoPosition(item1: Friendbutton, item2: self.view!, topValue: view.bounds.height * 0.35, bottomValue: -(view.bounds.height * 0.65), leftValue: view.bounds.width * 0.79, rightValue: -(view.bounds.width * 0.21), widthValue: 0.2, heightValue: 0.12)
        
        pos.autoPosition(item1: invitefriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: ConfirmFriendsbutton, item2: self.view!, topValue: view.bounds.height * 0.66, bottomValue: -(view.bounds.height * 0.34), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.3, heightValue: 0.13)
        
        pos.autoPosition(item1: Messagesbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.74, rightValue: -(view.bounds.width * 0.26), widthValue: 0.27, heightValue: 0.18)
        
        pos.autoPosition(item1: returnbtn, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
    }
    
    
    // receive button evnet
    @objc func receivebtnevent(sender:UIButton){
        
    }
    
    
    // send letter button evnet
    @objc func sendletterbtnevnet(sender:UIButton){
        composer.NextScene(nextScene: SendFriendsScene(size: self.size),view: &sView!)
        sendletterbtn.removeFromSuperview()
        receivebtn.removeFromSuperview()
        returnbtn.removeFromSuperview()
        Friendbutton.removeFromSuperview()
        invitefriendsbutton.removeFromSuperview()
        ConfirmFriendsbutton.removeFromSuperview()
        Messagesbutton.removeFromSuperview()
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
