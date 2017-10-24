//
//  InviteReward.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/16.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit

class CodeScene: SKScene {
    
    var sView: SKView?
    var CodeSprite : SKLabelNode!
    var CodeText = ""
    var myselfcode = [FriendCodeResponese]()
    override func didMove(to view: SKView) {
        
        sView = self.view
        CodeText = GetCode()
        let background = SKSpriteNode(imageNamed: "background-15")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        
        let inviteText = SKSpriteNode(imageNamed: "invitation code")
        inviteText.position = CGPoint(x: size.width/2, y: size.height/1.4)
        inviteText.size = CGSize(width: (sView?.bounds.size.width)!/2.8, height: (sView?.bounds.size.height)!/6)
        
        
        if (CodeText == "") {
            CodeSprite = SKLabelNode(text: "CodeText")
        }else{
            CodeSprite = SKLabelNode(text: CodeText)
        }
        
        CodeSprite.position = CGPoint(x: (sView?.bounds.size.width)!/2, y: (sView?.bounds.size.height)!/2.5)
        CodeSprite.fontSize = 56
        CodeSprite.fontName = "AvenirNext-Bold"
        CodeSprite.fontColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 1)
        
        addChild(background)
        addChild(inviteText)
        addChild(CodeSprite)
    }
    
    func GetCode() -> String {
        var postvalue = "email=\(account!)"
        let codejson = DatabasePost().postDatabase(URL: "http://mmlab.lhu.edu.tw/codemyself(swift).php", valuedata: postvalue)
        var jsoncount = codejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            var friendscode = FriendCodeResponese()
            friendscode.message = codejson[jsonIndex]["invite_code"] as! String
            self.myselfcode.append(friendscode)
        }
        var codejsonmsg = self.myselfcode[0].message
        
        return codejsonmsg
    }
    
}
