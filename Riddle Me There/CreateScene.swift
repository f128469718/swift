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



class CreateScene: SKScene,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    var sView : SKView?
    var submitbutton : UIButton!
    var camerabutton : UIButton!
    var titlefield : UITextField!
    var riddlefield : UITextView!
    var returnPress : UIButton!
    
    var maskingCameraRollchoice:Bool = false
    var newImage : SKSpriteNode!
    var Riddlepic : UIImage!
    
    var createriddledata = [CreateRiddleData]()
    var createResponse = [CreateRiddleResponse]()
    
    override func didMove(to view: SKView) {
      
        sView = self.view
        
        let background = pos.imageclass(image: "Background-5", x: size.width/2, y: size.height/2,z:-1)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        let title = pos.imageclass(image: "title button", x: size.width/5.9, y: size.height/1.28,z:0)
        let riddle = pos.imageclass(image: "riddle button", x: size.width/5.4, y: size.height/1.5,z:0)
        let awnser  = pos.imageclass(image: "awnser button", x: size.width/5, y: size.height/1.8,z:0)
        
        titlefield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.075, width: 205, height: 18, text: "", level: 2)
        riddlefield = UIdesign().TextView(x: view.bounds.width*0.35, y: view.bounds.height * 0.155, width: view.bounds.width * 0.37, height: view.bounds.height * 0.16, text: "")
        
        submitbutton = UIButton(frame:CGRect(x: 20, y: 245, width: 220, height: 80))
        submitbutton.setBackgroundImage(UIImage(named: "submit button"), for: UIControlState.normal)
        submitbutton.addTarget(self,action: #selector(submitbuttonevent),for: .touchUpInside)//修改按鈕細節
        
        camerabutton = camerabtn()
        
        returnPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        
        view.addSubview(returnPress)
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
        returnPress.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: submitbutton, item2: self.view!, topValue: view.bounds.height * 0.75, bottomValue: -(view.bounds.height * 0.25), leftValue: view.bounds.width * 0.01, rightValue: -(view.bounds.width * 0.99), widthValue: 0.4, heightValue: 0.3)
        
        pos.autoPosition(item1: camerabutton, item2: self.view!, topValue: view.bounds.height * 0.64, bottomValue: -(view.bounds.height * 0.36), leftValue: view.bounds.width * 0.57, rightValue: -(view.bounds.width * 0.43), widthValue: 0.08, heightValue: 0.12)
        
        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0.85, bottomValue: -(view.bounds.height * 0.15), leftValue: view.bounds.width * 0.85, rightValue: -(view.bounds.width * 0.15), widthValue: 0.13, heightValue: 0.2)
    }
    
    // submit button event
    @objc func submitbuttonevent(sender:UIButton){
        
        //var postdata = "email=andy@gmail.com&title=\(titlefield.text!)&Riddle=\(riddlefield.text!)"
        
        let createdata = CreateRiddleData()
        createdata.title = titlefield.text!
        createdata.riddle = riddlefield.text!
        self.createriddledata.append(createdata)
        
        //let creatjson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/createriddle.php", valuedata: postdata)
        
        let creatjson = DatabasePost().uploadImage(URL: "http://140.131.12.56/swift/createriddle.php", pic: Riddlepic, email: account, title: titlefield.text!, riddle: riddlefield.text!)
        
        /* var jsoncount = creatjson.count
         
         for jsonIndex in 0 ..< jsoncount{
         var createsesponse = CreateRiddleResponse()
         createsesponse.message = creatjson[jsonIndex]["Message"] as! String
         createsesponse.status = creatjson[jsonIndex]["Status"] as! String
         self.createResponse.append(createsesponse)
         }*/
        
        
        /*if (self.createResponse[0].status == "OK") {
         composer.NextScene(nextScene: MenuScene(size: self.size),view: &sView!)
         camerabutton.removeFromSuperview()
         submitbutton.removeFromSuperview()
         titlefield.removeFromSuperview()
         riddlefield.removeFromSuperview()
         }*/
        
        
        
    }
    
    // camera button event
    @objc func camerabuttonevent(sender:UIButton){
        
        getPhotoFromSource(source: UIImagePickerControllerSourceType.camera)
        
    }
    
    func camerabtn() -> UIButton{
        
        var btn = UIButton(frame:CGRect(x: 320, y: 210, width: 60, height: 60))
        btn.setBackgroundImage(UIImage(named: "camera"), for: UIControlState.normal)
        btn.addTarget(self,action: #selector(camerabuttonevent),for: .touchUpInside)//修改按鈕細節
        return btn
    }
    @objc func returnbtnevent() {
        composer.NextScene(nextScene: MenuScene(size: self.size), view: &sView!)
        camerabutton.removeFromSuperview()
        submitbutton.removeFromSuperview()
        titlefield.removeFromSuperview()
        riddlefield.removeFromSuperview()
        returnPress.removeFromSuperview()
    }
    
}

