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



class ProfileScene: SKScene {
    var sView : SKView?
    var EditProfilebtn : UIButton!
    var photobtn : UIButton!
    var returnPressbtn : UIButton!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // connect database get profile information
        var data = "email=andy@gmail.com"
        emptyString = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchprofile.php", valuedata: data, method: 4)
        print("\(emptyString.value1)")
        // background image
        let background = pos.imageclass(image: "background-16", x: size.width/2, y: size.height/2,z:-1)
        
        // profile image
        let Profile = pos.imageclass(image: "Profile", x: size.width/1.1, y: size.height/1.8, z:0)
        
        // email text image
        let email = pos.imageclass(image: "email2", x: size.width/4.2, y: size.height/2.9, z:0)
        
        // country text image
        let country = pos.imageclass(image: "country2", x: size.width/4.2, y: size.height/3.7, z:0)
        
        // age text image
        let age = pos.imageclass(image: "age1", x: size.width/4.2, y: size.height/1.35, z:0)
        
        // solve riddle text image
        let solvedriddles = pos.imageclass(image: "solvedriddles", x: size.width/3.6, y: size.height/5, z:0)
        
        // create riddle text image
        let createdriddles = pos.imageclass(image: "createdriddles", x: size.width/3.6, y: size.height/8, z:0)
        
        
        // name label
        let namelabel = SKLabelNode(text: emptyString.value1[0])
        namelabel.position = CGPoint(x: (sView?.bounds.width)! * 0.25, y: (sView?.bounds.height)! * 0.8)
        namelabel.fontSize = 20
        namelabel.fontColor = .black
        
        
        // age label
        let agelabel = SKLabelNode(text: emptyString.value1[2])
        agelabel.position = CGPoint(x: (sView?.bounds.width)! * 0.3, y: (sView?.bounds.height)! * 0.71)
        agelabel.fontSize = 20
        agelabel.fontColor = .black
        
        
        // gender label
        let genderlabel = SKLabelNode(text: emptyString.value1[3])
        genderlabel.position = CGPoint(x: (sView?.bounds.width)! * 0.25, y: (sView?.bounds.height)! * 0.6)
        genderlabel.fontSize = 20
        genderlabel.fontColor = .black
        
        
        // email label
        let emaillabel = SKLabelNode(text: "andy@gmail.com")
        emaillabel.position = CGPoint(x: (sView?.bounds.width)! * 0.45, y: (sView?.bounds.height)! * 0.33)
        emaillabel.fontSize = 20
        emaillabel.fontColor = .black
        
        
        // country label
        let countrylabel = SKLabelNode(text: emptyString.value1[1])
        countrylabel.position = CGPoint(x: (sView?.bounds.width)! * 0.5, y: (sView?.bounds.height)! * 0.25)
        countrylabel.fontSize = 20
        countrylabel.fontColor = .black
        
        
        // solve riddle label
        let solveriddlelabel = SKLabelNode(text: emptyString.value1[4])
        solveriddlelabel.position = CGPoint(x: (sView?.bounds.width)! * 0.5, y: (sView?.bounds.height)! * 0.18)
        solveriddlelabel.fontSize = 20
        solveriddlelabel.fontColor = .black
        
        
        // create riddle label
        let createriddlelabel = SKLabelNode(text: emptyString.value1[5])
        createriddlelabel.position = CGPoint(x: (sView?.bounds.width)! * 0.5, y: (sView?.bounds.height)! * 0.11)
        createriddlelabel.fontSize = 20
        createriddlelabel.fontColor = .black
        
        // Edit Profile Button
        EditProfilebtn = UIButton(frame:CGRect(x: 150, y: 150, width: 160, height: 60))
        EditProfilebtn.setBackgroundImage(UIImage(named: "EditProfile"), for: UIControlState.normal)
        EditProfilebtn.addTarget(self,action: #selector(EditProfilebtnevent),for: .touchUpInside)
        
        // return button
        returnPressbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPressbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPressbtn.addTarget(self,action: #selector(returnbuttonevent),for: .touchUpInside)//修改按鈕細節
        
        // photo button
        photobtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        photobtn.setBackgroundImage(UIImage(named: "No photo"), for: UIControlState.normal)
        photobtn.addTarget(self,action: #selector(photobtnevent),for: .touchUpInside)//修改按鈕細節

        view.addSubview(EditProfilebtn)
        view.addSubview(returnPressbtn)
        view.addSubview(photobtn)
        
        addChild(background)
        addChild(Profile)
        addChild(country)
        addChild(age)
        addChild(email)
        addChild(solvedriddles)
        addChild(createdriddles)
        addChild(namelabel)
        addChild(agelabel)
        addChild(genderlabel)
        addChild(emaillabel)
        addChild(countrylabel)
        addChild(solveriddlelabel)
        addChild(createriddlelabel)
        
        EditProfilebtn.translatesAutoresizingMaskIntoConstraints = false
        returnPressbtn.translatesAutoresizingMaskIntoConstraints = false
        photobtn.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: EditProfilebtn, item2: self.view!, topValue: view.bounds.height * 0.5, bottomValue: -(view.bounds.height * 0.5), leftValue: view.bounds.width * 0.69, rightValue: -(view.bounds.width * 0.31), widthValue: 0.31, heightValue: 0.15)
        
        pos.autoPosition(item1: photobtn, item2: self.view!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.51, rightValue: -(view.bounds.width * 0.49), widthValue: 0.18, heightValue: 0.25)
        
        pos.autoPosition(item1: returnPressbtn, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.04, rightValue: -(view.bounds.width * 0.96), widthValue: 0.14, heightValue: 0.19)
        
    }
    
    // Edit Profile button event
    @objc func EditProfilebtnevent(sender:UIButton){
        
    }
    
    // return button event
    @objc func returnbuttonevent(sender:UIButton){
        
    }
    
    // photo button event
    @objc func photobtnevent(sender:UIButton){
        
    }
    
}
