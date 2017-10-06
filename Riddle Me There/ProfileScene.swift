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



class ProfileScene: SKScene,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var sView : SKView?
    var EditProfilebtn : UIButton!
    var photobtn : UIButton!
    var returnPressbtn : UIButton!
    var photoimage : UIImage!
    var newImage : SKSpriteNode!
    var semaphore : DispatchSemaphore!
    
    var profileData = [UserDataResponse]()
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // connect database get profile information
        var postdata = "email=andy@gmail.com"
        var profilejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchprofile(swift).php", valuedata: postdata)
        
        var jsoncount = profilejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            var userdata = UserDataResponse()
            userdata.response = profilejson[jsonIndex]["response"] as! String
            self.profileData.append(userdata)
        }
        
        
        //print("\(emptyString.value1)")
        // background image
        let background = pos.imageclass(image: "background-16", x: size.width/2, y: size.height/2,z:-1)
         background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
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
        let namelabel = SKLabelNode(text: self.profileData[0].response)
        namelabel.position = CGPoint(x: size.width / 3.2, y: size.width / 1.85)
        namelabel.fontSize = 20
        namelabel.fontColor = .black
        
        
        // age label
        let agelabel = SKLabelNode(text: self.profileData[2].response)
        agelabel.position = CGPoint(x: size.width / 2.8, y: size.width / 2.1)
        agelabel.fontSize = 20
        agelabel.fontColor = .black
        
        
        // gender label
        let genderlabel = SKLabelNode(text: self.profileData[3].response)
        genderlabel.position = CGPoint(x: size.width / 3.2, y: size.width / 2.5)
        genderlabel.fontSize = 20
        genderlabel.fontColor = .black
        
        
        // email label
        let emaillabel = SKLabelNode(text: account!)
        emaillabel.position = CGPoint(x: size.width / 1.8, y: size.width / 4.5)
        emaillabel.fontSize = 20
        emaillabel.fontColor = .black
        
        
        // country label
        let countrylabel = SKLabelNode(text: self.profileData[2].response)
        countrylabel.position = CGPoint(x: size.width / 1.5, y: size.width / 5.9)
        countrylabel.fontSize = 20
        countrylabel.fontColor = .black
        
        
        // solve riddle label
        let solveriddlelabel = SKLabelNode(text: self.profileData[5].response)
        solveriddlelabel.position = CGPoint(x: size.width / 1.5, y: size.width / 8)
        solveriddlelabel.fontSize = 20
        solveriddlelabel.fontColor = .black
        
        
        // create riddle label
        let createriddlelabel = SKLabelNode(text: self.profileData[4].response)
        createriddlelabel.position = CGPoint(x: size.width / 1.5, y: size.width / 13)
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
        
        
       let phimage =  DataFile().read()
        if phimage != nil{
            let tex:SKTexture = SKTexture(image: phimage)
            newImage = SKSpriteNode(texture: tex)
            
            newImage.name = "cameraRollPicture"
            
            newImage.position = CGPoint(x: size.width / 1.65, y: size.height / 1.35)
            newImage.size = CGSize(width: size.width * 0.18, height: size.height * 0.28)
            
            
            self.addChild(newImage)
            photobtn.removeFromSuperview()
        }
        
    }
    
    // Edit Profile button event
    @objc func EditProfilebtnevent(sender:UIButton){
        
    }
    
    // return button event
    @objc func returnbuttonevent(sender:UIButton){
        
    }
    
    // photo button event
    @objc func photobtnevent(sender:UIButton){
       
       ChoosePhotoAlert()
       
      
    }
    
    
    // Choose Photo Alert
    func ChoosePhotoAlert(){
        // 建立一個提示框
        let alertController = UIAlertController(
        title: "選擇照片",
        message: "請選擇照片方式",
        preferredStyle: .alert)
        
        // 建立[取消]按鈕
        let cameraAction = UIAlertAction(
            title: "相機",
        style: .cancel,
        handler: {(alert: UIAlertAction!) in self.getPhotoFromSource(source: UIImagePickerControllerSourceType.camera)})
        alertController.addAction(cameraAction)
        
        // 建立[刪除]按鈕
        let photoAction = UIAlertAction(
        title: "相片庫",
        style: .default,
        handler:  {(alert: UIAlertAction!) in self.getPhotoFromSource(source: UIImagePickerControllerSourceType.photoLibrary)})
        alertController.addAction(photoAction)
        
        // 顯示提示框
        sView?.window?.rootViewController?.present(alertController, animated: true)
    }
    
    
    
}
