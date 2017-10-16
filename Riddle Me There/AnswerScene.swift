//
//  AnswerScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/9/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import MapKit

class AnswerScene: SKScene,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var sView : SKView?
    
    var cameraButton: UIButton!
    var useButton: UIButton!
    var retakeButton: UIButton!
    
    var answerPic : UIImage!
    
    var newImage : SKSpriteNode!
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    var AnswerData = [UserDataResponse]()
    
    override func didMove(to view: SKView) {
        
        sView = self.view
        
        let background = pos.imageclass(image: "background-10", x: size.width/2, y: size.height/2,z:-1)
        background.size = CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        addChild(background)
        
        print("riddenumber:\(riddenumber!)")
        
        print("ttttttttttttttttttttttttttttt")
        
        // camera button
        cameraButton = camerabtn()
        sView?.addSubview(cameraButton)
        
        // use button
        useButton = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        useButton.setBackgroundImage(UIImage(named: "use button"), for: UIControlState.normal)
        useButton.addTarget(self,action: #selector(useButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(useButton)
        
        
        // retake button
        retakeButton = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        retakeButton.setBackgroundImage(UIImage(named: "retake button"), for: UIControlState.normal)
        retakeButton.addTarget(self,action: #selector(retakeButtonevent),for: .touchUpInside)//修改按鈕細節
        sView?.addSubview(retakeButton)
        
        
        
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        useButton.translatesAutoresizingMaskIntoConstraints = false
        retakeButton.translatesAutoresizingMaskIntoConstraints = false
        
        pos.autoPosition(item1: cameraButton, item2: sView!, topValue: view.bounds.height * 0.4, bottomValue: -(view.bounds.height * 0.6), leftValue: view.bounds.width * 0.45, rightValue: -(view.bounds.width * 0.55), widthValue: 0.07, heightValue: 0.12)
        
        pos.autoPosition(item1: useButton, item2: sView!, topValue: view.bounds.height * 0.55, bottomValue: -(view.bounds.height * 0.45), leftValue: view.bounds.width * 0.04, rightValue: -(view.bounds.width * 0.96), widthValue: 0.15, heightValue: 0.1)
        
        pos.autoPosition(item1: retakeButton, item2: sView!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.05, rightValue: -(view.bounds.width * 0.95), widthValue: 0.22, heightValue: 0.12)
        
        
        locManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locManager.location
            print("latitude :\(currentLocation.coordinate.latitude)")
            print("longitude :\(currentLocation.coordinate.longitude)")
        }
    }
    
    
    
    func camerabtn() -> UIButton{
        
        var btn = UIButton(frame:CGRect(x: 320, y: 210, width: 60, height: 60))
        btn.setBackgroundImage(UIImage(named: "camera"), for: UIControlState.normal)
        btn.addTarget(self,action: #selector(cameraButtonevent),for: .touchUpInside)//修改按鈕細節
        
        return btn
    }
    
    // camera button event
    @objc func cameraButtonevent(sender:UIButton){
        getPhotoFromSource(source: UIImagePickerControllerSourceType.camera)
    }
    
    // use button event
    @objc func useButtonevent(sender:UIButton){
        let alertController = UIAlertController(
            title: "代碼",
            message: "請輸入代碼",
            preferredStyle: .alert)
        
        // 建立兩個輸入框
        alertController.addTextField {
            (textField: UITextField!) -> Void in
            textField.placeholder = "代碼"
        }
       
        
        // 建立[取消]按鈕
        let cancelAction = UIAlertAction(
            title: "取消",
            style: .cancel,
            handler: nil)
        alertController.addAction(cancelAction)
        
        // 建立[登入]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: UIAlertActionStyle.default) {
                (action: UIAlertAction!) -> Void in
                let code =
                    (alertController.textFields?.first)!
                        as UITextField
               
                
                print("輸入的帳號為：\(code.text)")
                var postvalue = "email=\(account!)&name=\(username!)&lat=\(self.currentLocation.coordinate.latitude)&lon=\(self.currentLocation.coordinate.longitude)&code=\(code.text!)&riddle_id=\(riddenumber!)"
                let answerjson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/solveriddle.php", valuedata: postvalue)
                
                
                var jsoncount = answerjson.count
                
                for jsonIndex in 0 ..< jsoncount{
                    let riddledata = UserDataResponse()
                    riddledata.response = answerjson[jsonIndex]["value"] as! String
                    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
                    print(answerjson[jsonIndex]["value"])
                    self.AnswerData.append(riddledata)
                }
                
                if ( self.AnswerData[0].response == "correct"){
                    
                    composer.NextScene(nextScene: SuccessScene(size: self.size),view: &self.sView!)
                    self.cameraButton.removeFromSuperview()
                    self.useButton.removeFromSuperview()
                    self.retakeButton.removeFromSuperview()
                    
                }else{
                    composer.NextScene(nextScene: FailScene(size: self.size),view: &self.sView!)
                    self.cameraButton.removeFromSuperview()
                    self.useButton.removeFromSuperview()
                    self.retakeButton.removeFromSuperview()
                }
               
        }
        alertController.addAction(okAction)
        
        // 顯示提示框
        sView?.window?.rootViewController?.present(alertController, animated: true)
    }
    
    // retake button event
    @objc func retakeButtonevent(sender:UIButton){
        if (newImage != nil){
            newImage.removeFromParent()
            cameraButton = camerabtn()
            sView?.addSubview(cameraButton)
            
            cameraButton.translatesAutoresizingMaskIntoConstraints = false
            pos.autoPosition(item1: cameraButton, item2: sView!, topValue: (view?.bounds.height)! * 0.4, bottomValue: -((view?.bounds.height)! * 0.6), leftValue: (view?.bounds.width)! * 0.45, rightValue: -((view?.bounds.width)! * 0.55), widthValue: 0.07, heightValue: 0.12)
        }
    }
}
