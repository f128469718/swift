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


var country1 : UIButton!
var global : UIButton!
var personal : UIButton!

class ScoresScene: SKScene {
    
    var sView : SKView?
    
    override func didMove(to view: SKView) {
        sView = self.view
        let background = SKSpriteNode(imageNamed: "background-9")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        
        let view1 = SKSpriteNode(imageNamed: "VIEW")
        view1.position = CGPoint(x: size.width/2, y: size.height/2)
        
        let reel = SKSpriteNode(imageNamed: "reel-1")
        reel.position = CGPoint(x: size.width/2, y: size.height/2)
        
        let friends = SKSpriteNode(imageNamed: "friends")
        friends.position = CGPoint(x: size.width/2, y: size.height/2)
        
        returnPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        addChild(background);addChild(view1);addChild(friends);addChild(reel)
        view.addSubview(returnPress)

        
        returnPress.translatesAutoresizingMaskIntoConstraints = false

        
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    
}
