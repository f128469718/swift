//
//  Position.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/19.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class Position {
    
    func imageclass(image:String,x:CGFloat,y:CGFloat,z:CGFloat) -> SKSpriteNode {
        let imageobject = SKSpriteNode(imageNamed:image)
        imageobject.position = CGPoint(x:x, y:y)
        imageobject.zPosition = z
        return imageobject
    }
    
    func autoPosition(item1: AnyObject, item2: AnyObject , topValue: CGFloat, bottomValue: CGFloat, leftValue: CGFloat , rightValue: CGFloat, widthValue: CGFloat , heightValue: CGFloat) {
        
        item1.topAnchor.constraint(equalTo: item2.topAnchor, constant: topValue).isActive = true
        item1.bottomAnchor.constraint(equalTo: item2.bottomAnchor, constant: bottomValue).isActive = true
        item1.leadingAnchor.constraint(equalTo: item2.leadingAnchor, constant: leftValue).isActive = true
        item1.trailingAnchor.constraint(equalTo: item2.trailingAnchor, constant: rightValue).isActive = true
        item1.widthAnchor.constraint(equalTo: item2.widthAnchor, multiplier: widthValue).isActive = true
        item1.heightAnchor.constraint(equalTo: item2.heightAnchor, multiplier: heightValue).isActive = true
    }
}

class UIdesign {
    
    func textfiled(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat,text: String,level:Int) -> UITextField {
        let textfiled = UITextField(frame: CGRect(x: x, y: y, width: width, height: height))
        textfiled.borderStyle = .roundedRect
        textfiled.clearButtonMode = .whileEditing
        textfiled.keyboardType = .emailAddress
        textfiled.returnKeyType = .done
        textfiled.textColor = .white
        textfiled.borderStyle = UITextBorderStyle.none
        if level == 1{
            textfiled.background = UIImage(named:"native")
        }else{
            textfiled.backgroundColor = .clear
        }
        textfiled.attributedPlaceholder = NSAttributedString(string: text,attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange])
        
        return textfiled
    }
    
    func TextView(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat,text: String) -> UITextView {
        let TextView = UITextView(frame: CGRect(x: x, y: y, width: width, height: height))
        TextView.textColor = UIColor.white
        TextView.keyboardType = .default
        TextView.returnKeyType = .done
        TextView.isEditable = true
        TextView.backgroundColor = UIColor.clear
        TextView.font = UIFont(name: "Helvetica-Light", size: 20)
        TextView.textAlignment = .left
        TextView.isSelectable = true
        return TextView
        
        
    }
    
    
}




