//
//  FailScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/9/8.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit

class FailScene: SKScene {
    
    var sView : SKView!
    
    var helpButton: UIButton!
    var menuButton: UIButton!
    
    
    override func didMove(to view: SKView) {
        
        sView = self.view
        
        let background = pos.imageclass(image: "Background-11", x: size.width/2, y: size.height/2,z:-1)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        
        
        helpButton =  UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        helpButton.setBackgroundImage(UIImage(named: "help button"), for: UIControlState.normal)
        helpButton.addTarget(self,action: #selector(helpButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(helpButton)
        
        menuButton =  UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        menuButton.setBackgroundImage(UIImage(named: "menu button"), for: UIControlState.normal)
        menuButton.addTarget(self,action: #selector(menuButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(menuButton)
        
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: helpButton, item2: sView!, topValue: view.bounds.height * 0.45, bottomValue: -(view.bounds.height * 0.55), leftValue: view.bounds.width * 0.48, rightValue: -(view.bounds.width * 0.52), widthValue: 0.18, heightValue: 0.12)
        
        pos.autoPosition(item1: menuButton, item2: sView!, topValue: view.bounds.height * 0.6, bottomValue: -(view.bounds.height * 0.4), leftValue: view.bounds.width * 0.48, rightValue: -(view.bounds.width * 0.52), widthValue: 0.3, heightValue: 0.12)
    }
    
    // help button event
    @objc func helpButtonevent(sender:UIButton){
        
    }
    
    // menu button event
    @objc func menuButtonevent(sender:UIButton){
        
    }
}

