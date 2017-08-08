//
//  AreaScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit

var reel2button : UIButton!
var reel3button : UIButton!
var reel4button : UIButton!
var returnPress : UIButton!

class AreaScene: SKScene {
    var sView : SKView?
   
    
    override func didMove(to view: SKView) {
        sView = self.view
        let background = pos.imageclass(image: "Background-7", x: size.width/2, y: size.height/2,z:-1)
        let Creat = pos.imageclass(image: "created riddles", x: size.width/1.1, y: size.height/1.8,z:1)
        let reel = pos.imageclass(image: "reel-1", x: size.width/1.08, y: size.height/3,z:0)
       
        reel2button = UIButton(frame:CGRect(x: 430, y: 175, width: 130, height: 35))
        reel2button.setBackgroundImage(UIImage(named: "local riddles"), for: UIControlState.normal)
        reel2button.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
        
        reel3button = UIButton(frame:CGRect(x: 410, y: 215, width: 150, height: 35))
        reel3button.setBackgroundImage(UIImage(named: "special riddles"), for: UIControlState.normal)
        reel3button.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節
        
        reel4button = UIButton(frame:CGRect(x: 450, y: 260, width: 75, height: 40))
        reel4button.setBackgroundImage(UIImage(named: "map-1"), for: UIControlState.normal)
        reel4button.addTarget(self,action: #selector(clickButton3),for: .touchUpInside)//修改按鈕細節
        
        returnPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton4),for: .touchUpInside)//修改按鈕細節
        
       
        view.addSubview(reel2button)
        view.addSubview(reel3button)
        view.addSubview(reel4button)
        view.addSubview(returnPress)
        
        addChild(background)
        addChild(Creat)
        addChild(reel)
        
        reel2button.translatesAutoresizingMaskIntoConstraints = false
        reel3button.translatesAutoresizingMaskIntoConstraints = false
        reel4button.translatesAutoresizingMaskIntoConstraints = false
        returnPress.translatesAutoresizingMaskIntoConstraints = false

        
        pos.autoPosition(item1: reel2button, item2: self.view!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.77, rightValue: -(view.bounds.width * 0.23), widthValue: 0.21, heightValue: 0.12)
       
        pos.autoPosition(item1: reel3button, item2: self.view!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.21, heightValue: 0.12)
       
        pos.autoPosition(item1: reel4button, item2: self.view!, topValue: view.bounds.height * 0.82, bottomValue: -(view.bounds.height * 0.18), leftValue: view.bounds.width * 0.78, rightValue: -(view.bounds.width * 0.22), widthValue: 0.1, heightValue: 0.11)
    
        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
    }
   
    @objc func clickButton1(sender:UIButton){
        
    }
    @objc func clickButton2(sender:UIButton){
        
    }
    @objc func clickButton3(sender:UIButton){
        
    }
    @objc func clickButton4(sender:UIButton){
        
    }
}
