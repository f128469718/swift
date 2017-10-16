//
//  CreateScene_Camera.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/11.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit

extension CreateScene {
    
    func getPhotoFromSource(source:UIImagePickerControllerSourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = .currentContext
            imagePicker.delegate = self
            imagePicker.sourceType = source
            imagePicker.allowsEditing = false
            
            let vc: UIViewController = (self.view?.window?.rootViewController)!
            
            vc.present(imagePicker, animated: true, completion: nil)
        }else {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if (picker.sourceType == UIImagePickerControllerSourceType.photoLibrary || picker.sourceType == UIImagePickerControllerSourceType.camera){
            
            if let cameraRollPicture = info[UIImagePickerControllerOriginalImage] as? UIImage {
                UserDefaults.standard.set(UIImagePNGRepresentation(cameraRollPicture), forKey: "cameraRollPicture")
                
                /*if (maskingCameraRollchoice == false) {
                 
                 
                 }else {
                 
                 }*/
                
                Riddlepic = info[UIImagePickerControllerOriginalImage] as? UIImage
                
                let tex:SKTexture = SKTexture(image: cameraRollPicture)
                
                newImage = SKSpriteNode(texture: tex)
                
                newImage.name = "cameraRollPicture"
                
                newImage.position = CGPoint(x: (sView?.bounds.size.width)! * 0.52, y: (sView?.bounds.height)! * 0.3)
                newImage.size = CGSize(width: (sView?.bounds.size.width)! * 0.25, height: (sView?.bounds.size.height)! * 0.3)
                //camerabutton.setBackgroundImage(cameraRollPicture, for: UIControlState.normal)
                camerabutton.removeFromSuperview()
                self.addChild(newImage)
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        picker.delegate = nil
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let touchedNode = self.atPoint(location)
            
            if touchedNode ==  newImage {
                
                getPhotoFromSource(source: UIImagePickerControllerSourceType.photoLibrary)
                
                
            }
        }
        
    }
    
}

extension AnswerScene {
    
    func getPhotoFromSource(source:UIImagePickerControllerSourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.modalPresentationStyle = .currentContext
            imagePicker.delegate = self
            imagePicker.sourceType = source
            imagePicker.allowsEditing = false
            
            let vc: UIViewController = (self.view?.window?.rootViewController)!
            
            vc.present(imagePicker, animated: true, completion: nil)
        }else {
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if (picker.sourceType == UIImagePickerControllerSourceType.photoLibrary || picker.sourceType == UIImagePickerControllerSourceType.camera){
            
            if let cameraRollPicture = info[UIImagePickerControllerOriginalImage] as? UIImage {
                UserDefaults.standard.set(UIImagePNGRepresentation(cameraRollPicture), forKey: "cameraRollPicture")
                
                /*if (maskingCameraRollchoice == false) {
                 
                 
                 }else {
                 
                 }*/
                
                answerPic = info[UIImagePickerControllerOriginalImage] as? UIImage
                
                let tex:SKTexture = SKTexture(image: cameraRollPicture)
                
                newImage = SKSpriteNode(texture: tex)
                
                newImage.name = "cameraRollPicture"
                
                newImage.position = CGPoint(x: (sView?.bounds.size.width)! * 0.48, y: (sView?.bounds.height)! * 0.58)
                newImage.size = CGSize(width: (sView?.bounds.size.width)! * 0.38, height: (sView?.bounds.size.height)! * 0.5)
                //camerabutton.setBackgroundImage(cameraRollPicture, for: UIControlState.normal)
                cameraButton.removeFromSuperview()
                self.addChild(newImage)
            }
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        picker.delegate = nil
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            let touchedNode = self.atPoint(location)
            
            if touchedNode ==  newImage {
                
                getPhotoFromSource(source: UIImagePickerControllerSourceType.camera)
                
                
            }
        }
        
    }
    
}

