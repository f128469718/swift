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
        
        let background = pos.imageclass(image: "background-9", x: size.width/2, y: size.height/2,z:-1)
        let view1 = pos.imageclass(image: "VIEW", x: size.width/5.8, y: size.height/2.5,z:0)
        let reel = pos.imageclass(image: "reel-1", x: size.width/1.05, y: size.height/2.5,z:0)
        let friends = pos.imageclass(image: "friends", x: size.width/2, y: size.height/2,z:1)
        
        returnPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        addChild(background);addChild(view1);addChild(friends);addChild(reel)
        view.addSubview(returnPress)

        
        returnPress.translatesAutoresizingMaskIntoConstraints = false

        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0, bottomValue: -(view.bounds.height * 1), leftValue: view.bounds.width * 0, rightValue: -(view.bounds.width * 1), widthValue: 0.14, heightValue: 0.19)
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    
}
