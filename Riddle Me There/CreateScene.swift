//
//  CreateScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 admin. All rights reserved.
//
import SpriteKit
import GameplayKit
import UIKit

var submitbutton : UIButton!
var titlefield : UITextField!
var riddlefield : UITextView!
var camerabutton : UIButton!

class CreateScene: SKScene {
    var sView : SKView?


    override func didMove(to view: SKView) {
        sView = self.view

        let background = pos.imageclass(image: "Background-5", x: size.width/2, y: size.height/2,z:-1)
        let title = pos.imageclass(image: "title button", x: size.width/5.9, y: size.height/1.28,z:0)
        let riddle = pos.imageclass(image: "riddle button", x: size.width/5.4, y: size.height/1.5,z:0)
        let awnser  = pos.imageclass(image: "awnser button", x: size.width/5, y: size.height/1.8,z:0)
        
        titlefield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.075, width: 205, height: 18, text: "", level: 2)
        riddlefield = UIdesign().TextView(x: view.bounds.width*0.35, y: view.bounds.height * 0.155, width: view.bounds.width * 0.37, height: view.bounds.height * 0.16, text: "")
        
        submitbutton = UIButton(frame:CGRect(x: 20, y: 245, width: 220, height: 80))
        submitbutton.setBackgroundImage(UIImage(named: "submit button"), for: UIControlState.normal)
        submitbutton.addTarget(self,action: #selector(submitbuttonevent),for: .touchUpInside)//修改按鈕細節
       
        camerabutton = UIButton(frame:CGRect(x: 320, y: 210, width: 60, height: 60))
        camerabutton.setBackgroundImage(UIImage(named: "camera"), for: UIControlState.normal)
        camerabutton.addTarget(self,action: #selector(camerabuttonevent),for: .touchUpInside)//修改按鈕細節
        
   

   
        view.addSubview(camerabutton)
        view.addSubview(titlefield)
        view.addSubview(riddlefield)
        view.addSubview(submitbutton)
        
        addChild(background)
        addChild(title)
        addChild(riddle)
        addChild(awnser)
    
        submitbutton.translatesAutoresizingMaskIntoConstraints = false
        camerabutton.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: submitbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.01, rightValue: -(view.bounds.width * 0.99), widthValue: 0.4, heightValue: 0.3)
        
        pos.autoPosition(item1: camerabutton, item2: self.view!, topValue: view.bounds.height * 0.64, bottomValue: -(view.bounds.height * 0.36), leftValue: view.bounds.width * 0.57, rightValue: -(view.bounds.width * 0.43), widthValue: 0.08, heightValue: 0.12)
    }
    
    // submit button event
    @objc func submitbuttonevent(sender:UIButton){
        
    }
    
    // camera button event
    @objc func camerabuttonevent(sender:UIButton){
        
    }
}
