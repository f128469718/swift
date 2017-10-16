//
//  CorrectScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/9/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class SuccessScene: SKScene {
    
    var sView : SKView?
    
    var likeButton: UIButton!
    var dislikeButton: UIButton!
    
    
    override func didMove(to view: SKView) {
        
        sView = self.view
        
        let background = pos.imageclass(image: "Background-14", x: size.width/2, y: size.height/2,z:-1)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        likeButton =  UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        likeButton.setBackgroundImage(UIImage(named: "like button"), for: UIControlState.normal)
        likeButton.addTarget(self,action: #selector(likeButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(likeButton)
        
        
        dislikeButton =  UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        dislikeButton.setBackgroundImage(UIImage(named: "dislike button"), for: UIControlState.normal)
        dislikeButton.addTarget(self,action: #selector(dislikeButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(dislikeButton)
        
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        dislikeButton.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: likeButton, item2: sView!, topValue: view.bounds.height * 0.35, bottomValue: -(view.bounds.height * 0.65), leftValue: view.bounds.width * 0.26, rightValue: -(view.bounds.width * 0.74), widthValue: 0.2, heightValue: 0.35)
        
        pos.autoPosition(item1: dislikeButton, item2: sView!, topValue: view.bounds.height * 0.3, bottomValue: -(view.bounds.height * 0.7), leftValue: view.bounds.width * 0.45, rightValue: -(view.bounds.width * 0.55), widthValue: 0.25, heightValue: 0.4)
    }
    
    // like button event
    @objc func likeButtonevent(sender:UIButton){
        composer.NextScene(nextScene: MenuScene(size: self.size),view: &self.sView!)
        self.likeButton.removeFromSuperview()
        self.dislikeButton.removeFromSuperview()
    }
    
    // dislike button event
    @objc func dislikeButtonevent(sender:UIButton){
        composer.NextScene(nextScene: MenuScene(size: self.size),view: &self.sView!)
        self.likeButton.removeFromSuperview()
        self.dislikeButton.removeFromSuperview()
    }
}

