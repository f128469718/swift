//
//  InviteReward.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit

class InviteReward: SKScene {
    
    var sView: SKView?
    var codeText : UITextField!
    var sendBtn : UIButton!
    var codemsg = ""
    var alertController : UIAlertController!
    var friendcoderesponse = [FriendCodeResponese]()
    override func didMove(to view: SKView) {
        
        sView = self.view
        
        let background = SKSpriteNode(imageNamed: "background-15")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let inviteText = SKSpriteNode(imageNamed: "inviteReward0")
        inviteText.position = CGPoint(x: size.width/2, y: size.height/1.4)
       
        
        
        addChild(background)
        addChild(inviteText)
        
        
        codeText = UIdesign().textfiled(x: (sView?.bounds.width)!*0.3, y: (sView?.bounds.height)! * 0.44, width: (sView?.bounds.width)!*0.4, height: 18, text: "", level: 1)
        sView?.addSubview(codeText)
        
        
        sendBtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        sendBtn.setBackgroundImage(UIImage(named: "send1"), for: UIControlState.normal)
        sendBtn.addTarget(self,action: #selector(sendBtnevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(sendBtn)
        
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        pos.autoPosition(item1: sendBtn, item2: sView!, topValue: view.bounds.height * 0.6, bottomValue: -(view.bounds.height * 0.4), leftValue: view.bounds.width * 0.42, rightValue: -(view.bounds.width * 0.58), widthValue: 0.16, heightValue: 0.09)
    }
    //\(account)
    @objc func sendBtnevent(sender:UIButton){
        var postvalue = "email=andy@gmail.com&code=\(codeText.text!)"
        let codejson = DatabasePost().postDatabase(URL: "http://mmlab.lhu.edu.tw/friendcode(swift).php", valuedata: postvalue)
        
        var jsoncount = codejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            var friendscode = FriendCodeResponese()
            friendscode.message = codejson[jsonIndex]["codemessage"] as! String
            self.friendcoderesponse.append(friendscode)
        }
        var codejsonmsg = self.friendcoderesponse[0].message
        if (codejsonmsg == "error"){
            var codemsg = "邀請碼錯誤"
            // 建立一個提示框
            alertController = UIAlertController(
                title: "邀請碼",
                message: "邀請碼錯誤",
                preferredStyle: .alert)
            
        }else if(codejsonmsg == "reuse"){
            var codemsg = "已使用過邀請碼"
            // 建立一個提示框
            alertController = UIAlertController(
                title: "邀請碼",
                message: "已使用過邀請碼",
                preferredStyle: .alert)
        }else if(codejsonmsg == "correct"){
            var codemsg = "獲得５０point"
            // 建立一個提示框
            alertController = UIAlertController(
                title: "邀請碼",
                message: "獲得５０point",
                preferredStyle: .alert)
        }
        
       
        
       
        
        // 建立[刪除]按鈕
        let confirmAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler: nil)
        alertController.addAction(confirmAction)
        
        // 顯示提示框
        sView?.window?.rootViewController?.present(alertController, animated: true)
    }
}
