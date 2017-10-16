//
//  Login.swift
//  Riddle Me There
//
//  Created by admin on 2017/5/23.
//  Copyright © 2017年 admin. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

var username: String!
class LoginScene: SKScene {
    var sView : SKView?
    
    let returnButton = SKSpriteNode(imageNamed: "return")
    let loginbutton = SKSpriteNode(imageNamed: "Login buttom1")
    var emailtextfield : UITextField!
    var pwdtextfield : UITextField!
    var email : UIImageView!
    var password : UIImageView!
    var switchDemo : UISwitch!
    var names = [String]()
    let testarray = [Position(),Composer()] as [Any]
    var loginresponse = [UserDataResponse]()
    var userresponse = [UserDataResponse]()
    var userlogin = [UserData]()
    
    override func didMove(to view: SKView) {
        sView = self.view
        /*var gameTableView = ShowTableview()
         gameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         gameTableView.frame=CGRect(x:20,y:50,width:280,height:200)
         gameTableView.backgroundColor = UIColor.clear
         self.scene?.view?.addSubview(gameTableView)
         gameTableView.reloadData()
         gameTableView.items = emptyString*/
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        let automatic = SKSpriteNode(imageNamed: "automatic login")
        automatic.position = CGPoint(x: size.width/2.8, y: size.height/2.8)
        
        email = UIImageView(image: UIImage(named: "email"))
        email.frame = CGRect(x: view.bounds.width*0.18, y: view.bounds.height * 0.28, width: 80, height: 30)
        
        password = UIImageView(image: UIImage(named: "password"))
        password.frame = CGRect(x: view.bounds.width*0.18, y: view.bounds.height * 0.40, width: 80, height: 30)
        
        
        emailtextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "請輸入信箱", level: 1)
        
        pwdtextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.3, width: 200, height: 20, text: "請輸入密碼", level: 1)
        
        
        
        returnButton.position = CGPoint(x: size.width/4.3, y: size.height * 0.13)
        loginbutton.position = CGPoint(x: size.width/1.35, y: size.height * 0.15)
        background.zPosition = -1
        
        switchDemo = UISwitch(frame:CGRect(origin:CGPoint(x:size.width/1.35,y:size.height * 0.75 ), size: CGSize(width:1,height:1)))
        switchDemo.addTarget(
            self,
            action:
            #selector(switchValueDidChange),
            for: .valueChanged)
        //let switchDemo = UISwitch(frame:CGRect(x: size.width/1.55, y: size.height * 0.63, width: 0, height: 0))
        
        print(modelName)
        
        view.addSubview(email)
        view.addSubview(password)
        view.addSubview(emailtextfield)
        view.addSubview(pwdtextfield)
        view.addSubview(switchDemo)
        addChild(background)
        addChild(automatic)
        addChild(loginbutton)
        addChild(returnButton)
        
        
        email.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        emailtextfield.translatesAutoresizingMaskIntoConstraints = false
        pwdtextfield.translatesAutoresizingMaskIntoConstraints = false
        switchDemo.translatesAutoresizingMaskIntoConstraints = false
        
        //email
        pos.autoPosition(item1: email, item2: self.view!, topValue: view.bounds.height * 0.3, bottomValue: -(view.bounds.height * 0.7), leftValue: view.bounds.width * 0.2, rightValue: -(view.bounds.width * 0.8), widthValue: 0.12, heightValue: 0.08)
        
        //native0
        pos.autoPosition(item1: emailtextfield, item2: self.view!, topValue: view.bounds.height * 0.315, bottomValue: -(view.bounds.height * 0.685), leftValue: view.bounds.width * 0.4, rightValue: -(view.bounds.width * 0.6), widthValue: 0.28, heightValue: 0.05)
        
        //password
        pos.autoPosition(item1: password, item2: self.view!, topValue: view.bounds.height * 0.45, bottomValue: -(view.bounds.height * 0.55), leftValue: view.bounds.width * 0.2, rightValue: -(view.bounds.width * 0.8), widthValue: 0.12, heightValue: 0.08)
        
        //native1
        pos.autoPosition(item1: pwdtextfield, item2: self.view!, topValue: view.bounds.height * 0.465, bottomValue: -(view.bounds.height * 0.535), leftValue: view.bounds.width * 0.4, rightValue: -(view.bounds.width * 0.6), widthValue: 0.28, heightValue: 0.05)
        
        //switchDemo
        pos.autoPosition(item1: switchDemo, item2: self.view!, topValue: view.bounds.height * 0.6, bottomValue: -(view.bounds.height * 0.4), leftValue: view.bounds.width * 0.6, rightValue: -(view.bounds.width * 0.4), widthValue: 0.28, heightValue: 0.05)
        
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let touchedNode = self.atPoint(location)
            
            if touchedNode ==  loginbutton {
                
                print("Press loginbutton")
                print("native0.text : \(emailtextfield.text!)")
                print("native1.text : \(pwdtextfield.text!)")
                var logindata = UserData()
                
                
                var postdata = "email=\(emailtextfield.text!)&password=\(pwdtextfield.text!)"
                
                let loginjson = DatabasePost().postDatabase(URL: "http://mmlab.lhu.edu.tw/Login(swift).php", valuedata: postdata)
                
                var jsoncount = loginjson.count
                
                for jsonIndex in 0 ..< jsoncount{
                    var dataresponse = UserDataResponse()
                    dataresponse.response = loginjson[jsonIndex]["value"] as! String
                    self.loginresponse.append(dataresponse)
                }
                
                let userjson = DatabasePost().postDatabase(URL: "http://mmlab.lhu.edu.tw/username(swift).php", valuedata: postdata)
                
                jsoncount = userjson.count
                
                for jsonIndex in 0 ..< jsoncount{
                    var username = UserDataResponse()
                    username.response = loginjson[jsonIndex]["value"] as! String
                    self.userresponse.append(username)
                }
                //print("emptyString:\(emptyString)")
                username = self.userresponse[0].response
                
                if ( self.loginresponse[0].response == "true"){
                   
                    account = emailtextfield.text
                    composer.NextScene(nextScene: MenuScene(size: self.size),view: &sView!)
                    email.removeFromSuperview()
                    password.removeFromSuperview()
                    emailtextfield.removeFromSuperview()
                    pwdtextfield.removeFromSuperview()
                    switchDemo.removeFromSuperview()
                }else{
                    
                }
                
                
                
                
            }else if touchedNode == returnButton {
                print("Press registerButton")
                
                composer.NextScene(nextScene: MainMenuScene(size: self.size),view: &sView!)
                
                email.removeFromSuperview()
                password.removeFromSuperview()
                emailtextfield.removeFromSuperview()
                pwdtextfield.removeFromSuperview()
                switchDemo.removeFromSuperview()
            }
        }
        
    }
    
    @objc func switchValueDidChange(sender:UISwitch)
    {
        if (sender.isOn == true){
            print(" switch button is on")
        }
        else{
            print("switch button is off")
        }
    }
    
}


