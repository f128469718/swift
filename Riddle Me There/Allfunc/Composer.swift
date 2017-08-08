//
//  Composer.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/5.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import SpriteKit

class Composer: SKScene {
    
    
    func NextScene(nextScene: SKScene ,view: inout SKView) {
        
        let transition:SKTransition = SKTransition.crossFade(withDuration: 0.5)
        view.presentScene(nextScene, transition: transition)
    }
    
    func SceneEmpty(view: inout SKView) {
        view.scene?.removeAllActions()
        view.scene?.removeFromParent()
        view.scene?.removeAllChildren()
        view.presentScene(nil)
    }
    
}
