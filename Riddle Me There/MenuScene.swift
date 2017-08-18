//
//  MenuScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/28.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import MapKit

class MenuScene: SKScene {
    var sView : SKView!
    var background : SKSpriteNode!
    var solvebtn : UIButton!
    var createbtn : UIButton!
    var areabtn : UIButton!
    var friendbtn : UIButton!
    var profilebtn : UIButton!
    var scorebtn : UIButton!
    var extrabtn : UIButton!
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background
        background = pos.imageclass(image: "Background-3", x: size.width * 0.5, y: size.height * 0.5, z: -1)
        
        // solve button
        solvebtn = UIButton(frame:CGRect(x: 240, y: 5, width: 160, height: 60))
        solvebtn.setBackgroundImage(UIImage(named: "Solve button"), for: UIControlState.normal)
        solvebtn.addTarget(self,action: #selector(solvebtnevent),for: .touchUpInside)
        
        // create button
        createbtn = UIButton(frame:CGRect(x: 150, y: 60, width: 160, height: 60))
        createbtn.setBackgroundImage(UIImage(named: "Create button"), for: UIControlState.normal)
        createbtn.addTarget(self,action: #selector(createbtnevent),for: .touchUpInside)
        
        // area button
        areabtn = UIButton(frame:CGRect(x: 260, y: 90, width: 160, height: 60))
        areabtn.setBackgroundImage(UIImage(named: "Area button"), for: UIControlState.normal)
        areabtn.addTarget(self,action: #selector(areabtnevent),for: .touchUpInside)
        
        // friend button
        friendbtn = UIButton(frame:CGRect(x: 150, y: 150, width: 160, height: 60))
        friendbtn.setBackgroundImage(UIImage(named: "Friends button"), for: UIControlState.normal)
        friendbtn.addTarget(self,action: #selector(friendbtnevent),for: .touchUpInside)
        
        // profile button
        profilebtn = UIButton(frame:CGRect(x: 260, y: 180, width: 160, height: 60))
        profilebtn.setBackgroundImage(UIImage(named: "Profile button"), for: UIControlState.normal)
        profilebtn.addTarget(self,action: #selector(profilebtnevent),for: .touchUpInside)
        
        // score button
        scorebtn = UIButton(frame:CGRect(x: 150, y: 240, width: 160, height: 60))
        scorebtn.setBackgroundImage(UIImage(named: "Score button"), for: UIControlState.normal)
        scorebtn.addTarget(self,action: #selector(scorebtnevent),for: .touchUpInside)
        
        // extra button
        extrabtn = UIButton(frame:CGRect(x: 280, y: 260, width: 160, height: 60))
        extrabtn.setBackgroundImage(UIImage(named: "Extra button"), for: UIControlState.normal)
        extrabtn.addTarget(self,action: #selector(extrabtnevent),for: .touchUpInside)
        
        // add view
        addChild(background)
        sView.addSubview(solvebtn)
        sView.addSubview(createbtn)
        sView.addSubview(areabtn)
        sView.addSubview(friendbtn)
        sView.addSubview(profilebtn)
        sView.addSubview(scorebtn)
        sView.addSubview(extrabtn)
        
        // close autolayout
        solvebtn.translatesAutoresizingMaskIntoConstraints = false
        createbtn.translatesAutoresizingMaskIntoConstraints = false
        areabtn.translatesAutoresizingMaskIntoConstraints = false
        friendbtn.translatesAutoresizingMaskIntoConstraints = false
        profilebtn.translatesAutoresizingMaskIntoConstraints = false
        scorebtn.translatesAutoresizingMaskIntoConstraints = false
        extrabtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        // set autolayout position
        // solvebtn
        pos.autoPosition(item1: solvebtn, item2: self.view!, topValue: view.bounds.height * 0.02, bottomValue: -(view.bounds.height * 0.98), leftValue: view.bounds.width * 0.4, rightValue: -(view.bounds.width * 0.6), widthValue: 0.3, heightValue: 0.2)
        
        // createbtn
        pos.autoPosition(item1: createbtn, item2: self.view!, topValue: view.bounds.height * 0.2, bottomValue: -(view.bounds.height * 0.8), leftValue: view.bounds.width * 0.25, rightValue: -(view.bounds.width * 0.75), widthValue: 0.28, heightValue: 0.205)
        
        // areabtn
        pos.autoPosition(item1: areabtn, item2: self.view!, topValue: view.bounds.height * 0.28, bottomValue: -(view.bounds.height * 0.72), leftValue: view.bounds.width * 0.45, rightValue: -(view.bounds.width * 0.55), widthValue: 0.3, heightValue: 0.205)
        
        // friendbtn
        pos.autoPosition(item1: friendbtn, item2: self.view!, topValue: view.bounds.height * 0.46, bottomValue: -(view.bounds.height * 0.54), leftValue: view.bounds.width * 0.25, rightValue: -(view.bounds.width * 0.75), widthValue: 0.3, heightValue: 0.21)
        
        // profilebtn
        pos.autoPosition(item1: profilebtn, item2: self.view!, topValue: view.bounds.height * 0.55, bottomValue: -(view.bounds.height * 0.45), leftValue: view.bounds.width * 0.46, rightValue: -(view.bounds.width * 0.54), widthValue: 0.28, heightValue: 0.2)
        
        // scorebtn
        pos.autoPosition(item1: scorebtn, item2: self.view!, topValue: view.bounds.height * 0.73, bottomValue: -(view.bounds.height * 0.27), leftValue: view.bounds.width * 0.25, rightValue: -(view.bounds.width * 0.75), widthValue: 0.3, heightValue: 0.2)
        
        // extrabtn
        pos.autoPosition(item1: extrabtn, item2: self.view!, topValue: view.bounds.height * 0.8, bottomValue: -(view.bounds.height * 0.2), leftValue: view.bounds.width * 0.48, rightValue: -(view.bounds.width * 0.52), widthValue: 0.3, heightValue: 0.2)
        
        locManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locManager.location
           print("latitude :\(currentLocation.coordinate.latitude)")
            print("longitude :\(currentLocation.coordinate.longitude)")
        }
    }
    
    // solve button event
    @objc func solvebtnevent(sender:UIButton){
        composer.NextScene(nextScene: SolveScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    // create button event
    @objc func createbtnevent(sender:UIButton){
        composer.NextScene(nextScene: CreateScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    // area button event
    @objc func areabtnevent(sender:UIButton){
        composer.NextScene(nextScene: AreaScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    // friend button event
    @objc func friendbtnevent(sender:UIButton){
        composer.NextScene(nextScene: FriendsScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    // profile button event
    @objc func profilebtnevent(sender:UIButton){
        composer.NextScene(nextScene: ProfileScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    // score button event
    @objc func scorebtnevent(sender:UIButton){
        composer.NextScene(nextScene: ScoresScene(size: self.size),view: &sView!)
        
         solvebtn.removeFromSuperview()
         createbtn.removeFromSuperview()
         areabtn.removeFromSuperview()
         friendbtn.removeFromSuperview()
         profilebtn.removeFromSuperview()
         scorebtn.removeFromSuperview()
         extrabtn.removeFromSuperview()
    }
    
    // extra button event
    @objc func extrabtnevent(sender:UIButton){
        composer.NextScene(nextScene: ExtraScene(size: self.size),view: &sView!)
        solvebtn.removeFromSuperview()
        createbtn.removeFromSuperview()
        areabtn.removeFromSuperview()
        friendbtn.removeFromSuperview()
        profilebtn.removeFromSuperview()
        scorebtn.removeFromSuperview()
        extrabtn.removeFromSuperview()
    }
    
    
}

