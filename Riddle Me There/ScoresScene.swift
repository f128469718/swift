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
    var Country1Press : UIButton!
    var GlobalPress : UIButton!
    var PersonalPress : UIButton!
    var totalPress : UIButton!
    var createdPress : UIButton!
    var solvedPress : UIButton!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = pos.imageclass(image: "background-9", x: size.width/2, y: size.height/2,z:-1)
        let view1 = pos.imageclass(image: "VIEW", x: size.width/5.8, y: size.height/2.5,z:0)
        let reel = pos.imageclass(image: "reel-1", x: size.width/1.09, y: size.height/3.2,z:0)
        let friends = pos.imageclass(image: "friends", x: size.width/1.1, y: size.height/1.95,z:1)
        
        returnPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        Country1Press = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        Country1Press.setBackgroundImage(UIImage(named: "country1"), for: UIControlState.normal)
        Country1Press.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
        
        GlobalPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        GlobalPress.setBackgroundImage(UIImage(named: "global"), for: UIControlState.normal)
        GlobalPress.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節
        
        PersonalPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        PersonalPress.setBackgroundImage(UIImage(named: "personal"), for: UIControlState.normal)
        PersonalPress.addTarget(self,action: #selector(clickButton3),for: .touchUpInside)//修改按鈕細節
        
        totalPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        totalPress.setBackgroundImage(UIImage(named: "total"), for: UIControlState.normal)
        totalPress.addTarget(self,action: #selector(clickButton4),for: .touchUpInside)//修改按鈕細節
        
        createdPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        createdPress.setBackgroundImage(UIImage(named: "created"), for: UIControlState.normal)
        createdPress.addTarget(self,action: #selector(clickButton5),for: .touchUpInside)//修改按鈕細節
        
        solvedPress = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        solvedPress.setBackgroundImage(UIImage(named: "solved"), for: UIControlState.normal)
        solvedPress.addTarget(self,action: #selector(clickButton6),for: .touchUpInside)//修改按鈕細節
        
        addChild(background);addChild(view1);addChild(friends);addChild(reel)
    view.addSubview(returnPress);view.addSubview(Country1Press);view.addSubview(GlobalPress);view.addSubview(PersonalPress);view.addSubview(totalPress);view.addSubview(createdPress);view.addSubview(solvedPress)

        
        returnPress.translatesAutoresizingMaskIntoConstraints = false
        Country1Press.translatesAutoresizingMaskIntoConstraints = false
        GlobalPress.translatesAutoresizingMaskIntoConstraints = false
        PersonalPress.translatesAutoresizingMaskIntoConstraints = false
        totalPress.translatesAutoresizingMaskIntoConstraints = false
        createdPress.translatesAutoresizingMaskIntoConstraints = false
        solvedPress.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0, bottomValue: -(view.bounds.height * 1), leftValue: view.bounds.width * 0, rightValue: -(view.bounds.width * 1), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: Country1Press, item2: self.view!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.2, heightValue: 0.15)
        
        pos.autoPosition(item1: GlobalPress, item2: self.view!, topValue: view.bounds.height * 0.7, bottomValue: -(view.bounds.height * 0.3), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.2, heightValue: 0.13)
        
        pos.autoPosition(item1: PersonalPress, item2: self.view!, topValue: view.bounds.height * 0.78, bottomValue: -(view.bounds.height * 0.22), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.23, heightValue: 0.25)
        
        pos.autoPosition(item1: totalPress, item2: self.view!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.09, rightValue: -(view.bounds.width * 0.91), widthValue: 0.14, heightValue: 0.11)
        
        pos.autoPosition(item1: createdPress, item2: self.view!, topValue: view.bounds.height * 0.76, bottomValue: -(view.bounds.height * 0.24), leftValue: view.bounds.width * 0.05, rightValue: -(view.bounds.width * 0.95), widthValue: 0.18, heightValue: 0.1)
        
        pos.autoPosition(item1: solvedPress, item2: self.view!, topValue: view.bounds.height * 0.85, bottomValue: -(view.bounds.height * 0.15), leftValue: view.bounds.width * 0.04, rightValue: -(view.bounds.width * 0.96), widthValue: 0.18, heightValue: 0.1)
        
        
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
    @objc func clickButton6(sender:UIButton){
        
    }
    
}
