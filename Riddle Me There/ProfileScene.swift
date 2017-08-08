//
//  Profile.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/4.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

import SpriteKit
import GameplayKit
import UIKit

var EditProfileButton : UIButton!
var photo : UIButton!

class ProfileScene: SKScene {
    var sView : SKView?
    
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = pos.imageclass(image: "background-16", x: size.width/2, y: size.height/2,z:-1)
        let Profile = pos.imageclass(image: "Profile", x: size.width/1.1, y: size.height/1.8, z:0)
        let email2 = pos.imageclass(image: "email2", x: size.width/4.2, y: size.height/2.9, z:0)
        let country2 = pos.imageclass(image: "country2", x: size.width/4.2, y: size.height/3.7, z:0)
        let age1 = pos.imageclass(image: "age1", x: size.width/4.2, y: size.height/1.35, z:0)
        let solvedriddles = pos.imageclass(image: "solvedriddles", x: size.width/3.6, y: size.height/5, z:0)
        let createdriddles = pos.imageclass(image: "createdriddles", x: size.width/3.6, y: size.height/8, z:0)
        
        EditProfileButton = UIButton(frame:CGRect(x: 150, y: 150, width: 160, height: 60))
        EditProfileButton.setBackgroundImage(UIImage(named: "EditProfile"), for: UIControlState.normal)
        EditProfileButton.addTarget(self,action: #selector(clickButton),for: .touchUpInside)
        
        returnPress1 = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress1.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress1.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
        
        photo = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        photo.setBackgroundImage(UIImage(named: "No photo"), for: UIControlState.normal)
        photo.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節

        view.addSubview(EditProfileButton);view.addSubview(returnPress1)
        view.addSubview(photo)
        addChild(background);addChild(Profile);addChild(country2)
        addChild(age1);addChild(email2);addChild(solvedriddles)
        addChild(createdriddles)
        
        EditProfileButton.translatesAutoresizingMaskIntoConstraints = false
        returnPress1.translatesAutoresizingMaskIntoConstraints = false
        photo.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: EditProfileButton, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.31, heightValue: 0.15)
        
        pos.autoPosition(item1: photo, item2: self.view!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.51, rightValue: -(view.bounds.width * 0.49), widthValue: 0.18, heightValue: 0.25)
        
        pos.autoPosition(item1: returnPress1, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.04, rightValue: -(view.bounds.width * 0.96), widthValue: 0.14, heightValue: 0.19)
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    @objc func clickButton1(sender:UIButton){
        
    }
    @objc func clickButton2(sender:UIButton){
        
    }
    
}
