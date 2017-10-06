//
//  SpecialScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/18.
//  Copyright © 2017年 admin. All rights reserved.
//


import Foundation
import SpriteKit
import GameplayKit
import UIKit


class SpecialScene: SKScene {
    var sView : SKView?
    
    var CreatRiddlesbtn : UIButton!
    var localriddlesbtn : UIButton!
    var mapbtn : UIButton!
    var returnbtn : UIButton!
    
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background image
        let background = pos.imageclass(image: "Background-7", x: size.width/2, y: size.height/2,z:-1)
        
        // create riddle text image
        let specialimage = pos.imageclass(image: "special riddles", x: size.width/1.15, y: size.height/3.3,z:1)
        
        // four button background image
        let reelimage = pos.imageclass(image: "reel-1", x: size.width/1.08, y: size.height/3,z:0)
        
        // local riddles button
        CreatRiddlesbtn = UIButton(frame:CGRect(x: 430, y: 175, width: 130, height: 35))
        CreatRiddlesbtn.setBackgroundImage(UIImage(named: "created riddles"), for: UIControlState.normal)
        CreatRiddlesbtn.addTarget(self,action: #selector(CreatRiddlesbtnevent),for: .touchUpInside)//修改按鈕細節
        
        //special riddles button
        localriddlesbtn = UIButton(frame:CGRect(x: 410, y: 215, width: 150, height: 35))
        localriddlesbtn.setBackgroundImage(UIImage(named: "local riddles"), for: UIControlState.normal)
        localriddlesbtn.addTarget(self,action: #selector(localriddlesbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // map button
        mapbtn = UIButton(frame:CGRect(x: 450, y: 260, width: 75, height: 40))
        mapbtn.setBackgroundImage(UIImage(named: "map-1"), for: UIControlState.normal)
        mapbtn.addTarget(self,action: #selector(mapbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // return button
        returnbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        // add view
        sView?.addSubview(CreatRiddlesbtn)
        sView?.addSubview(localriddlesbtn)
        sView?.addSubview(mapbtn)
        sView?.addSubview(returnbtn)
        
        
        addChild(background)
        addChild(specialimage)
        addChild(reelimage)
        
        
        //close auto layout
        CreatRiddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        localriddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        mapbtn.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        
        //set auto layout
        pos.autoPosition(item1: CreatRiddlesbtn, item2: sView!, topValue: view.bounds.height * 0.4, bottomValue: -(view.bounds.height * 0.6), leftValue: view.bounds.width * 0.79, rightValue: -(view.bounds.width * 0.21), widthValue: 0.21, heightValue: 0.15)
        
        pos.autoPosition(item1: localriddlesbtn, item2: sView!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.23, heightValue: 0.12)
        
        pos.autoPosition(item1: mapbtn, item2: sView!, topValue: view.bounds.height * 0.81, bottomValue: -(view.bounds.height * 0.19), leftValue: view.bounds.width * 0.79, rightValue: -(view.bounds.width * 0.21), widthValue: 0.12, heightValue: 0.13)
        
        pos.autoPosition(item1: returnbtn, item2: sView!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
  
    }
    
    // local riddles button event
    @objc func CreatRiddlesbtnevent(sender:UIButton){
        composer.NextScene(nextScene: AreaScene(size: self.size), view: &sView!)
        
        CreatRiddlesbtn.removeFromSuperview()
        localriddlesbtn.removeFromSuperview()
        mapbtn.removeFromSuperview()
        returnbtn.removeFromSuperview()
        
    }
    
    // special riddles button event
    @objc func localriddlesbtnevent(sender:UIButton){
        
    }
    
    // map button event
    @objc func mapbtnevent(sender:UIButton){
        
    }
    
    // return button event
    @objc func returnbtnevent(sender:UIButton){
        composer.NextScene(nextScene: MenuScene(size: self.size), view: &sView!)
        
        CreatRiddlesbtn.removeFromSuperview()
        localriddlesbtn.removeFromSuperview()
        mapbtn.removeFromSuperview()
        returnbtn.removeFromSuperview()
        
    }
}


