//
//  AreaScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/31.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit
import UIKit



class AreaScene: SKScene {
    
    var sView : SKView?
    
    var localriddlesbtn : UIButton!
    var specialriddlesbtn : UIButton!
    var mapbtn : UIButton!
    var returnbtn : UIButton!
    
    
    var gameTableView = ShowTableview()
    
    var riddleData = [RiddleData]()
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background image
        let background = pos.imageclass(image: "Background-7", x: size.width/2, y: size.height/2,z:-1)
         background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        // create riddle text image
        let Creatimage = pos.imageclass(image: "created riddles", x: size.width/1.1, y: size.height/1.8,z:1)
        
        // four button background image
        let reelimage = pos.imageclass(image: "reel-1", x: size.width/1.08, y: size.height/3,z:0)
       
        // local riddles button
        localriddlesbtn = UIButton(frame:CGRect(x: 430, y: 175, width: 130, height: 35))
        localriddlesbtn.setBackgroundImage(UIImage(named: "local riddles"), for: UIControlState.normal)
        localriddlesbtn.addTarget(self,action: #selector(localriddlesbtnevent),for: .touchUpInside)//修改按鈕細節
        
        //special riddles button
        specialriddlesbtn = UIButton(frame:CGRect(x: 410, y: 215, width: 150, height: 35))
        specialriddlesbtn.setBackgroundImage(UIImage(named: "special riddles"), for: UIControlState.normal)
        specialriddlesbtn.addTarget(self,action: #selector(specialriddlesbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // map button
        mapbtn = UIButton(frame:CGRect(x: 450, y: 260, width: 75, height: 40))
        mapbtn.setBackgroundImage(UIImage(named: "map-1"), for: UIControlState.normal)
        mapbtn.addTarget(self,action: #selector(mapbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // return button
        returnbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)//修改按鈕細節
        
        
        //tableview
        var postvalue = "email=\(account!)"
        let riddlejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchcreateriddle.php", valuedata: postvalue)
        
        
        var jsoncount = riddlejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            let riddledata = RiddleData()
            riddledata.title = riddlejson[jsonIndex]["title"] as! String
            riddledata.riddle = riddlejson[jsonIndex]["riddle"] as! String
            riddledata.likeriddle = riddlejson[jsonIndex]["riddlelike"] as! String
            riddledata.dislikeriddle = riddlejson[jsonIndex]["riddledislike"] as! String
            self.riddleData.append(riddledata)
        }
        gameTableView.sView = sView!
        gameTableView.vWidth = (sView?.bounds.width)!
        gameTableView.vHeight = (sView?.bounds.height)!
        
        gameTableView.title = "Riddle"
        
        for index in 0 ..< self.riddleData.count {
            gameTableView.items.append(self.riddleData[index].title)
            gameTableView.items2.append(self.riddleData[index].riddle)
            gameTableView.items3.append(self.riddleData[index].likeriddle)
            gameTableView.items4.append(self.riddleData[index].dislikeriddle)
        }
        /*gameTableView.items = emptyString.value1
        gameTableView.items2 = emptyString.value2
        gameTableView.items3 = emptyString.value3
        gameTableView.items4 = emptyString.value4*/
        gameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        gameTableView.frame=CGRect(x:20,y:50,width:280,height:200)
        gameTableView.backgroundColor = UIColor.clear
        
        gameTableView.reloadData()
        
        
        
        
        // add view
        sView?.addSubview(localriddlesbtn)
        sView?.addSubview(specialriddlesbtn)
        sView?.addSubview(mapbtn)
        sView?.addSubview(returnbtn)
        sView?.addSubview(gameTableView)
        
        addChild(background)
        addChild(Creatimage)
        addChild(reelimage)
        
        
        //close auto layout
        localriddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        specialriddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        mapbtn.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //set auto layout
        pos.autoPosition(item1: localriddlesbtn, item2: sView!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.77, rightValue: -(view.bounds.width * 0.23), widthValue: 0.21, heightValue: 0.12)
       
        pos.autoPosition(item1: specialriddlesbtn, item2: sView!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.21, heightValue: 0.12)
       
        pos.autoPosition(item1: mapbtn, item2: sView!, topValue: view.bounds.height * 0.82, bottomValue: -(view.bounds.height * 0.18), leftValue: view.bounds.width * 0.78, rightValue: -(view.bounds.width * 0.22), widthValue: 0.1, heightValue: 0.11)
    
        pos.autoPosition(item1: returnbtn, item2: sView!, topValue: view.bounds.height * 0.84, bottomValue: -(view.bounds.height * 0.16), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: gameTableView, item2: sView!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.26, rightValue: -(view.bounds.width * 0.74), widthValue: 0.4, heightValue: 0.8)
        
        
        
        
        
       
    }
   
    // local riddles button event
    @objc func localriddlesbtnevent(sender:UIButton){
        composer.NextScene(nextScene: LocalScene(size: self.size),view: &sView!)
       
        localriddlesbtn.removeFromSuperview()
        specialriddlesbtn.removeFromSuperview()
        mapbtn.removeFromSuperview()
        returnbtn.removeFromSuperview()
        gameTableView.removeFromSuperview()
    }
    
    // special riddles button event
    @objc func specialriddlesbtnevent(sender:UIButton){
        
    }
    
    // map button event
    @objc func mapbtnevent(sender:UIButton){
        
    }
    
    // return button event
    @objc func returnbtnevent(sender:UIButton){
        
    }
}
