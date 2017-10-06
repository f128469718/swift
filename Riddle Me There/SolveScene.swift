//
//  SolveScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/28.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit



class SolveScene : SKScene {
    var sView : SKView!
    var background: SKSpriteNode!
    var returnbtn :  UIButton!
    var gameTableView = ShowTableview()
    var solveriddledata = [SolveRiddleData]()
    
    override func didMove(to view: SKView) {
        sView = self.view
        var postvalue = "email=\(account)"
        let solvejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchsolveriddle.php", valuedata: postvalue)
        
        
        var jsoncount = solvejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            var nationdata = SolveRiddleData()
            nationdata.title = solvejson[jsonIndex]["title"] as! String
            nationdata.riddle = solvejson[jsonIndex]["riddle"] as! String
            nationdata.likeriddle = solvejson[jsonIndex]["riddlelike"] as! String
            nationdata.dislikeriddle = solvejson[jsonIndex]["riddledislike"] as! String
            self.solveriddledata.append(nationdata)
        }
        
        
        gameTableView.sView = sView
        gameTableView.vWidth = sView.bounds.width
        gameTableView.vHeight = sView.bounds.height
        
        gameTableView.title = "Solve Riddle"
        
        
        for index in 0 ..< self.solveriddledata.count {
            gameTableView.items.append(self.solveriddledata[index].title)
            gameTableView.items2.append(self.solveriddledata[index].riddle)
            gameTableView.items3.append(self.solveriddledata[index].likeriddle)
            gameTableView.items4.append(self.solveriddledata[index].dislikeriddle)
        }
        /*gameTableView.items = emptyString.value1
        gameTableView.items2 = emptyString.value2
        gameTableView.items3 = emptyString.value3
        gameTableView.items4 = emptyString.value4*/
        gameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        gameTableView.frame=CGRect(x:20,y:50,width:280,height:200)
        gameTableView.backgroundColor = UIColor.clear
        
        gameTableView.reloadData()
        
        background = pos.imageclass(image: "Background-4", x: size.width * 0.5, y: size.height * 0.5, z: -1)
        
        returnbtn = UIButton(frame:CGRect(x: sView.bounds.width * 0.1, y: sView.bounds.height * 0.8, width: sView.bounds.width * 0.1, height: sView.bounds.width * 0.1))
        returnbtn.setBackgroundImage(UIImage(named: "returnPress"), for: UIControlState.normal)
        returnbtn.addTarget(self,action: #selector(returnbtnevent),for: .touchUpInside)
        
        
        addChild(background)
        sView.addSubview(returnbtn)
        sView.addSubview(gameTableView)
        
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: returnbtn, item2: self.view!, topValue: view.bounds.height * 0.8, bottomValue: -(view.bounds.height * 0.2), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.15, heightValue: 0.2)
        
        pos.autoPosition(item1: gameTableView, item2: self.view!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.3, rightValue: -(view.bounds.width * 0.7), widthValue: 0.4, heightValue: 0.8)
    }
    
    // return button event
    @objc func returnbtnevent(sender:UIButton){
        composer.NextScene(nextScene: MenuScene(size: self.size),view: &sView!)
        returnbtn.removeFromSuperview()
        gameTableView.removeFromSuperview()
        
    }
}

