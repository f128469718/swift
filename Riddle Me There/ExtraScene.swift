//
//  ExtraScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/14.
//  Copyright © 2017年 admin. All rights reserved.

import Foundation
import SpriteKit
import UIKit
import SpriteKit


class ExtraScene: SKScene {
    var sView : SKView?
    var giftPress : UIButton!
    var systemPress : UIButton!
    var helpPress : UIButton!
    var AAMEPress : UIButton!
    var logoutPress : UIButton!
    var returnPress : UIButton!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = pos.imageclass(image: "background-15", x: size.width/2, y: size.height/2,z:-1)
         background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        returnPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        giftPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        giftPress.setBackgroundImage(UIImage(named: "gift button"), for: UIControlState.normal)
        giftPress.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
        
        systemPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        systemPress.setBackgroundImage(UIImage(named: "system status button"), for: UIControlState.normal)
        systemPress.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節
        
        helpPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        helpPress.setBackgroundImage(UIImage(named: "help button"), for: UIControlState.normal)
        helpPress.addTarget(self,action: #selector(clickButton3),for: .touchUpInside)//修改按鈕細節
        
        AAMEPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        AAMEPress.setBackgroundImage(UIImage(named: "AAME button"), for: UIControlState.normal)
        AAMEPress.addTarget(self,action: #selector(clickButton4),for: .touchUpInside)//修改按鈕細節
        
        logoutPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        logoutPress.setBackgroundImage(UIImage(named: "log out"), for: UIControlState.normal)
        logoutPress.addTarget(self,action: #selector(clickButton5),for: .touchUpInside)//修改按鈕細節
        
       
        
        view.addSubview(returnPress);view.addSubview(giftPress);view.addSubview(systemPress);view.addSubview(helpPress);view.addSubview(AAMEPress);view.addSubview(logoutPress)
            addChild(background)
        
        returnPress.translatesAutoresizingMaskIntoConstraints = false
        giftPress.translatesAutoresizingMaskIntoConstraints = false
        systemPress.translatesAutoresizingMaskIntoConstraints = false
        helpPress.translatesAutoresizingMaskIntoConstraints = false
        AAMEPress.translatesAutoresizingMaskIntoConstraints = false
        logoutPress.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: giftPress, item2: self.view!, topValue: view.bounds.height * 0.18, bottomValue: -(view.bounds.height * 0.82), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.31, heightValue: 0.11)
        
        pos.autoPosition(item1: systemPress, item2: self.view!, topValue: view.bounds.height * 0.31, bottomValue: -(view.bounds.height * 0.69), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.34, heightValue: 0.11)
        
        pos.autoPosition(item1: helpPress, item2: self.view!, topValue: view.bounds.height * 0.44, bottomValue: -(view.bounds.height * 0.56), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.18, heightValue: 0.11)
        
        pos.autoPosition(item1: AAMEPress, item2: self.view!, topValue: view.bounds.height * 0.56, bottomValue: -(view.bounds.height * 0.44), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.45, heightValue: 0.11)
        
        pos.autoPosition(item1: logoutPress, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.88, rightValue: -(view.bounds.width * 0.12), widthValue: 0.14, heightValue: 0.17)
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    @objc func clickButton1(sender:UIButton){
        
    }
    @objc func clickButton2(sender:UIButton){
        
    }
    @objc func clickButton3(sender:UIButton){
        
    }
    @objc func clickButton4(sender:UIButton){
        
    }
    @objc func clickButton5(sender:UIButton){
        
    }
    
}
