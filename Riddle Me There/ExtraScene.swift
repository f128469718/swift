//
//  ExtraScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/14.
//  Copyright © 2017年 admin. All rights reserved.

import Foundation
import SpriteKit
import UIKit
import SpriteKit


class ExtraScene: SKScene {
    var sView : SKView?
    var giftbtn : UIButton!
    var systemstatebtn : UIButton!
    var helpbtn : UIButton!
    var AAMEbtn : UIButton!
    var logoutbtn : UIButton!
    var returnPress : UIButton!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = pos.imageclass(image: "background-15", x: size.width/2, y: size.height/2,z:-1)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        returnPress = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnPress.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnPress.addTarget(self,action: #selector(clickButton),for: .touchUpInside)//修改按鈕細節
        
        giftbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        giftbtn.setBackgroundImage(UIImage(named: "gift button"), for: UIControlState.normal)
        giftbtn.addTarget(self,action: #selector(giftbtnevent),for: .touchUpInside)//修改按鈕細節
        
        systemstatebtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        systemstatebtn.setBackgroundImage(UIImage(named: "system status button"), for: UIControlState.normal)
        systemstatebtn.addTarget(self,action: #selector(systemstatebtnevent),for: .touchUpInside)//修改按鈕細節
        
        helpbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        helpbtn.setBackgroundImage(UIImage(named: "help button"), for: UIControlState.normal)
        helpbtn.addTarget(self,action: #selector(helpbtnevent),for: .touchUpInside)//修改按鈕細節
        
        AAMEbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        AAMEbtn.setBackgroundImage(UIImage(named: "AAME button"), for: UIControlState.normal)
        AAMEbtn.addTarget(self,action: #selector(AAMEbtnevent),for: .touchUpInside)//修改按鈕細節
        
        logoutbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        logoutbtn.setBackgroundImage(UIImage(named: "log out"), for: UIControlState.normal)
        logoutbtn.addTarget(self,action: #selector(logoutbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        
        view.addSubview(returnPress);view.addSubview(giftbtn);view.addSubview(systemstatebtn);view.addSubview(helpbtn);view.addSubview(AAMEbtn);view.addSubview(logoutbtn)
        addChild(background)
        
        returnPress.translatesAutoresizingMaskIntoConstraints = false
        giftbtn.translatesAutoresizingMaskIntoConstraints = false
        systemstatebtn.translatesAutoresizingMaskIntoConstraints = false
        helpbtn.translatesAutoresizingMaskIntoConstraints = false
        AAMEbtn.translatesAutoresizingMaskIntoConstraints = false
        logoutbtn.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: returnPress, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: giftbtn, item2: self.view!, topValue: view.bounds.height * 0.18, bottomValue: -(view.bounds.height * 0.82), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.31, heightValue: 0.11)
        
        pos.autoPosition(item1: systemstatebtn, item2: self.view!, topValue: view.bounds.height * 0.31, bottomValue: -(view.bounds.height * 0.69), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.34, heightValue: 0.11)
        
        pos.autoPosition(item1: helpbtn, item2: self.view!, topValue: view.bounds.height * 0.44, bottomValue: -(view.bounds.height * 0.56), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.18, heightValue: 0.11)
        
        pos.autoPosition(item1: AAMEbtn, item2: self.view!, topValue: view.bounds.height * 0.56, bottomValue: -(view.bounds.height * 0.44), leftValue: view.bounds.width * 0.35, rightValue: -(view.bounds.width * 0.65), widthValue: 0.45, heightValue: 0.11)
        
        pos.autoPosition(item1: logoutbtn, item2: self.view!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.88, rightValue: -(view.bounds.width * 0.12), widthValue: 0.14, heightValue: 0.17)
        
    }
    @objc func clickButton(sender:UIButton){
        
    }
    @objc func giftbtnevent(sender:UIButton){
        composer.NextScene(nextScene: MenuScene(size: self.size),view: &sView!)
        logoutbtn.removeFromSuperview()
        AAMEbtn.removeFromSuperview()
        systemstatebtn.removeFromSuperview()
        giftbtn.removeFromSuperview()
        returnPress.removeFromSuperview()
    }
    @objc func systemstatebtnevent(sender:UIButton){
        
    }
    @objc func helpbtnevent(sender:UIButton){
        
    }
    @objc func AAMEbtnevent(sender:UIButton){
        
    }
    @objc func logoutbtnevent(sender:UIButton){
        
    }
    
}

