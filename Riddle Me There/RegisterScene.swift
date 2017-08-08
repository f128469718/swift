//
//  Register.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/24.
//  Copyright © 2017年 admin. All rights reserved.
//


import SpriteKit
import GameplayKit
import UIKit

class RegisterScene: SKScene {
    var sView : SKView?
    
    var morebutton :UIButton!
    var malebutton :UIButton!
    var femalebutton : UIButton!
    var returnbutton : UIButton!
    var Registerbutton : UIButton!
    var confirmbtn : UIButton!
    var countrytextfield : UITextField!
    var emailtextfield : UITextField!
    var usernametextfield : UITextField!
    var pwdtextfield : UITextField!
    var agetextfield : UITextField!
    var firstnametextfield : UITextField!
    var lastnametextfield : UITextField!
    let myViewController = ShowPickerView()
    let myViewController2 = ShowPickerViewUI()
    var myPickerView: UIPickerView!
    var selectoption: Int!
    var gendervalue: String!
    
    override func didMove(to view: SKView){
        sView = self.view
    
        let background = pos.imageclass(image: "Background-1", x: size.width/2, y: size.height/2,z:-1)
        let country = pos.imageclass(image: "country", x: size.width/4.65, y: size.height/1.2, z: 0)
        let email = pos.imageclass(image: "email", x: size.width/4.47, y: size.height/1.33, z: 0)
        let username = pos.imageclass(image: "username", x: size.width/4.5, y: size.height/1.5, z: 0)
        let password = pos.imageclass(image: "password", x: size.width/4.5, y: size.height/1.71, z: 0)
        let age = pos.imageclass(image: "age", x: size.width/4.2, y: size.height/2,z: 0)
        let Gender = pos.imageclass(image: "Gender", x: size.width/3.8, y: size.height/2.4,z: 0)
        let Firstname = pos.imageclass(image: "Firstname", x: size.width/3.4, y: size.height/3.1,z: 0)
        let Lastname = pos.imageclass(image: "Lastname", x: size.width/3.4, y: size.height/4.1,z: 0)
        let quill = pos.imageclass(image: "quill", x: size.width/1.2, y: size.height/2.3,z: 0)
        let native = pos.imageclass(image: "native", x: size.width/2.4, y: size.height/1.2,z:0)
        //myViewController.hide()
        
        returnbutton = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        returnbutton.setBackgroundImage(UIImage(named: "return"), for: UIControlState.normal)
        returnbutton.addTarget(self,action: #selector(clickButton1),for: .touchUpInside)//修改按鈕細節
   
        Registerbutton = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        Registerbutton.setBackgroundImage(UIImage(named: "Register buttom"), for: UIControlState.normal)
        Registerbutton.addTarget(self,action: #selector(clickButton2),for: .touchUpInside)//修改按鈕細節
        
        femalebutton = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        femalebutton.setBackgroundImage(UIImage(named: "female"), for: UIControlState.normal)
        femalebutton.addTarget(self,action: #selector(clickButton3),for: .touchUpInside)//修改按鈕細節
        
        malebutton = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        malebutton.setBackgroundImage(UIImage(named: "male"), for: UIControlState.normal)
        malebutton.addTarget(self,action: #selector(clickButton4),for: .touchUpInside)//修改按鈕細節
       
        morebutton = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        morebutton.setBackgroundImage(UIImage(named: "more"), for: UIControlState.normal)
        morebutton.addTarget(self,action: #selector(clickButton5),for: .touchUpInside)//修改按鈕細節
        
        confirmbtn = UIButton(frame:CGRect(x: 20, y: 20, width: 120, height: 40))
        confirmbtn.backgroundColor = UIColor.darkGray
        confirmbtn.addTarget(self,action: #selector(clickButton6),for: .touchUpInside)
        confirmbtn.isHidden = true
        
       
        emailtextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        usernametextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        pwdtextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        agetextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        firstnametextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        lastnametextfield = UIdesign().textfiled(x: view.bounds.width*0.35, y: view.bounds.height * 0.42, width: 200, height: 20, text: "",level: 1)
        
       
        myPickerView = UIPickerView(frame: CGRect(
            x: 0, y: (sView?.bounds.height)! * 0.3,
            width: (sView?.bounds.width)!, height: 150))
        myPickerView.backgroundColor = UIColor(red: 1, green: 0.980392, blue: 0.941176, alpha: 1)
        myPickerView.isHidden = true
        
        view.addSubview(Registerbutton);view.addSubview(returnbutton)
        view.addSubview(malebutton);view.addSubview(femalebutton)
        view.addSubview(morebutton);view.addSubview(confirmbtn)
        view.addSubview(emailtextfield);view.addSubview(usernametextfield)
        view.addSubview(pwdtextfield);view.addSubview(agetextfield)
        view.addSubview(firstnametextfield);view.addSubview(lastnametextfield)


        addChild(native);addChild(quill);addChild(background);addChild(country)
        addChild(email);addChild(username);addChild(password);addChild(age)
        addChild(Gender);addChild(Firstname);addChild(Lastname)
        
         emailtextfield.translatesAutoresizingMaskIntoConstraints = false
         usernametextfield.translatesAutoresizingMaskIntoConstraints = false
         pwdtextfield.translatesAutoresizingMaskIntoConstraints = false
         agetextfield.translatesAutoresizingMaskIntoConstraints = false
         firstnametextfield.translatesAutoresizingMaskIntoConstraints = false
         lastnametextfield.translatesAutoresizingMaskIntoConstraints = false

         malebutton.translatesAutoresizingMaskIntoConstraints = false
         femalebutton.translatesAutoresizingMaskIntoConstraints = false
         returnbutton.translatesAutoresizingMaskIntoConstraints = false
         Registerbutton.translatesAutoresizingMaskIntoConstraints = false
         morebutton.translatesAutoresizingMaskIntoConstraints = false

        //returnbutton
        pos.autoPosition(item1: returnbutton, item2: self.view!, topValue: view.bounds.height * 0.83, bottomValue: -(view.bounds.height * 0.17), leftValue: view.bounds.width * 0, rightValue: -(view.bounds.width * 1), widthValue: 0.4, heightValue: 0.25)
        
        //Registerbutton
        pos.autoPosition(item1: Registerbutton, item2: self.view!, topValue: view.bounds.height * 0.83, bottomValue: -(view.bounds.height * 0.17), leftValue: view.bounds.width * 0.63, rightValue: -(view.bounds.width * 0.37), widthValue: 0.4, heightValue: 0.25)
        
        //femalebutton
        pos.autoPosition(item1: femalebutton,item2: self.view!, topValue: view.bounds.height * 0.57, bottomValue: -(view.bounds.height * 0.43), leftValue: view.bounds.width * 0.38, rightValue: -(view.bounds.width * 0.62), widthValue: 0.05, heightValue: 0.07)
        
        //malebutton
        pos.autoPosition(item1: malebutton,item2: self.view!, topValue: view.bounds.height * 0.57, bottomValue: -(view.bounds.height * 0.43), leftValue: view.bounds.width * 0.50, rightValue: -(view.bounds.width * 0.50), widthValue: 0.05, heightValue: 0.07)
       
        //morebutton
        pos.autoPosition(item1: morebutton, item2: self.view!, topValue: view.bounds.height * 0.08, bottomValue: -(view.bounds.height * 0.92), leftValue: view.bounds.width * 0.54, rightValue: -(view.bounds.width * 0.46), widthValue: 0.06, heightValue: 0.06)
        
        //email
        pos.autoPosition(item1: emailtextfield, item2: self.view!, topValue: view.bounds.height * 0.18, bottomValue: -(view.bounds.height * 0.82), leftValue: view.bounds.width * 0.30, rightValue: -(view.bounds.width * 0.70), widthValue: 0.22, heightValue: 0.05)
        //username
        pos.autoPosition(item1: usernametextfield, item2: self.view!, topValue: view.bounds.height * 0.28, bottomValue: -(view.bounds.height * 0.72), leftValue: view.bounds.width * 0.30, rightValue: -(view.bounds.width * 0.70), widthValue: 0.22, heightValue: 0.05)
        //password
        pos.autoPosition(item1: pwdtextfield, item2: self.view!, topValue: view.bounds.height * 0.38, bottomValue: -(view.bounds.height * 0.62), leftValue: view.bounds.width * 0.30, rightValue: -(view.bounds.width * 0.70), widthValue: 0.22, heightValue: 0.05)
        //age
        pos.autoPosition(item1: agetextfield, item2: self.view!, topValue: view.bounds.height * 0.48, bottomValue: -(view.bounds.height * 0.52), leftValue: view.bounds.width * 0.30, rightValue: -(view.bounds.width * 0.70), widthValue: 0.22, heightValue: 0.05)
        //Firstname
        pos.autoPosition(item1: firstnametextfield, item2: self.view!, topValue: view.bounds.height * 0.70, bottomValue: -(view.bounds.height * 0.30), leftValue: view.bounds.width * 0.45, rightValue: -(view.bounds.width * 0.55), widthValue: 0.22, heightValue: 0.05)
        //lastname
        pos.autoPosition(item1: lastnametextfield, item2: self.view!, topValue: view.bounds.height * 0.78, bottomValue: -(view.bounds.height * 0.22), leftValue: view.bounds.width * 0.45, rightValue: -(view.bounds.width * 0.55), widthValue: 0.22, heightValue: 0.05)
        
    }
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("123321")
        for touch in touches {
            /*let location = touch.location(in: self)
            
            let touchedNode = self.atPoint(location)
            
            if touchedNode ==  Registerbutton {
                
                print("Press Registerbutton")
                
                
            }else if touchedNode == returnbutton {
                print("Press returnbutton")
                composer.NextScene(nextScene: MainMenuScene(size: self.size),view: &sView!)
            }*/
            
            print(touch)
        }
    }
    @objc func clickButton1(sender:UIButton){
        
        composer.NextScene(nextScene: MainMenuScene(size: self.size),view: &sView!)
        Registerbutton.removeFromSuperview()
        returnbutton.removeFromSuperview()
        malebutton.removeFromSuperview()
        femalebutton.removeFromSuperview()
        morebutton.removeFromSuperview()
        emailtextfield.removeFromSuperview()
        usernametextfield.removeFromSuperview()
        pwdtextfield.removeFromSuperview()
        agetextfield.removeFromSuperview()
        firstnametextfield.removeFromSuperview()
        lastnametextfield.removeFromSuperview()
    }
    
    @objc func clickButton2(sender:UIButton){
        var data = "firstname=\(firstnametextfield.text!)&lastname=\(lastnametextfield.text!)&username=\(usernametextfield.text!)&email=\(emailtextfield.text!)&password=\(pwdtextfield.text!)&country=\(countrytextfield.text!)&age=\(agetextfield.text!)&gender=\(gendervalue)"
        
        emptyString = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/register.php", valuedata: data, method: 2)
        
        if emptyString.value == "correct" {
            print("success");
        }
    }
    
    @objc func clickButton3(sender:UIButton){
        selectoption = 2
        confirmbtn.isHidden = false
        myPickerView.isHidden = false

        sView?.addSubview(myPickerView)
        myPickerView.delegate = myViewController2
        myPickerView.dataSource = myViewController2
    }
    
    @objc func clickButton4(sender:UIButton){
        
    }
    
    @objc func clickButton5(sender:UIButton){
        selectoption = 1
         confirmbtn.isHidden = false
        myPickerView.isHidden = false

        var countrydata = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/selectcountry.php", valuedata: "", method: 1)
        
        
        //myViewController.ArrayInit()
        
        myViewController.country = countrydata.abbname
        
        sView?.addSubview(myPickerView)
        myPickerView.delegate = myViewController
        myPickerView.dataSource = myViewController
        
        
        //myViewController.hide()
    }
    
    @objc func clickButton6(sender:UIButton){
        print(myViewController.countryVauleString)
        confirmbtn.isHidden = true
        myPickerView.isHidden = true
        if selectoption == 1 {
            print("123")
            countrytextfield.text = myViewController.countryVauleString
        }else if selectoption == 2 {
            print(myViewController2.countryVauleString)
            femalebutton.setBackgroundImage(UIImage(named: myViewController2.countryVauleString), for: UIControlState.normal)
            gendervalue = myViewController2.countryVauleString
        }
        
    }
   
}
