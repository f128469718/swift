//
//  MainMenuScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/5/23.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import SpriteKit

struct Country {
    let name: Array<String>
    let chname: Array<String>
    let abbname: Array<String>
    let value4 : Array<String>
    let value: String
}


var emptyString: Country!
let pos = Position()
let composer = Composer()
var account : String!
class MainMenuScene: SKScene {
    
    
    var sView : SKView?
    let registerButton = SKSpriteNode(imageNamed: "Register buttom1")
    let loginbutton = SKSpriteNode(imageNamed: "Login buttom1")
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        let background = SKSpriteNode(imageNamed: "Background-2")
        
        let leftImage = SKSpriteNode(imageNamed: "map")
        
        
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        leftImage.position = CGPoint(x: size.width/3, y: size.height/2)
        registerButton.position = CGPoint(x: size.width/1.62, y: size.height * 0.47)
        loginbutton.position = CGPoint(x: size.width/1.5, y: size.height * 0.3)
        
        leftImage.size = CGSize(width: 300, height: 300)
        background.zPosition = -1
        leftImage.zPosition = 1
        
        addChild(background)
        addChild(leftImage)
        addChild(registerButton)
        addChild(loginbutton)
        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let touchedNode = self.atPoint(location)
            
            if touchedNode ==  loginbutton {
                
                print("Press loginbutton")
                
                composer.NextScene(nextScene: LoginScene(size: self.size),view: &sView!)

                
            }else if touchedNode == registerButton {
                print("Press registerButton")
                composer.NextScene(nextScene: RegisterScene(size: self.size),view: &sView!)
            }
        }
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("event canceled!")
    }
    override func update(_ currentTime: CFTimeInterval){
        
    }
    
    
    
}


