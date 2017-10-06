//
//  DatabasePost.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit

class DatabasePost {
    
    var splitedArray = Array<String>()
    func postDatabase(URL: String,valuedata: String) -> [[String : Any]]{
        var stringValue : [[String : Any]]!
        
        
        let request = NSMutableURLRequest(url: NSURL(string: URL)! as URL)
        /*let request = NSMutableURLRequest(url: NSURL(string: "http://140.131.12.56/test.php")! as URL)*/
        request.httpMethod = "POST"
        print(URL)
        let postString = valuedata
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        //信號
        let semaphore = DispatchSemaphore(value: 0)
        
        //task.resume() 非同步執行
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response , error in
            if error != nil {
                print("error=\(String(describing: error))")
                return
            }else{
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [[String : Any]]
                print("json : \(json)")
                
                if ((json) != nil) {
                    stringValue = json!
                }
                /*if (method == 1 ){
                    
                    for jsons in json!! {
                        if let name = jsons["name"] as? String {
                            if let chname = jsons["ch_name"] as? String {
                                if let abbname = jsons["abb_name"] as? String {
                                    names.append(name)
                                    chnames.append(chname)
                                    abbnames.append(abbname)
                                    let user = Country(value1: names, value2: chnames, value3: abbnames, value4: arrayvalue4, value5: "")
                                    stringValue = user
                                }
                            }
                        }
                    }
                }else if (method == 3){
                    for jsons in json!! {
                        if let title = jsons["title"] as? String {
                            if let riddle = jsons["riddle"] as? String {
                                if let riddlelike = jsons["riddlelike"] as? String {
                                    if let riddledislike = jsons["riddledislike"] as? String {
                                        names.append(title)
                                        chnames.append(riddle)
                                        abbnames.append(riddlelike)
                                        arrayvalue4.append(riddledislike)
                                        let user = Country(value1: names, value2: chnames, value3: abbnames, value4: arrayvalue4, value5:"")
                                        stringValue = user
                                        
                                    }
                                }
                            }
                        }
                    }
                }else if (method == 4){
                    for jsons in json!! {
                        if let value = jsons["value"] as? String {
                            
                            names.append(value)
                           
                            let user = Country(value1: names, value2: chnames, value3: abbnames, value4: arrayvalue4, value5:"")
                            stringValue = user
                                        
                            
                        }
                    }
                }else if (method == 5){
                    for jsons in json!! {
                        if let name = jsons["name"] as? String{
                            if let score = jsons["grade"] as? String{
                                if let creates = jsons["created"] as? String{
                                    if let solves = jsons["solved"] as? String{
                                        
                                        names.append(name)
                                        chnames.append(score)
                                        abbnames.append(creates)
                                        arrayvalue4.append(solves)
                                        let user = Country(value1: names, value2: chnames, value3: abbnames, value4: arrayvalue4, value5:"")
                                        stringValue = user
                                    }
                                }
                                
                            }
                        }
                    }
                }*/
                
               
            }
            
            
            
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(String(describing: responseString))")
            
            print("data : \(String(describing: data))")
            /*if (method == 2){
                if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                    print("stringData : \(stringData)") //JSONSerialization
                    //self.splitedArray = stringData.components(separatedBy:",")
                    //print("splitedArray : \(self.splitedArray)")
                    let user = Country(value1: names, value2: chnames, value3: abbnames, value4: arrayvalue4, value5: stringData)
                    stringValue = user
                }
            }*/
            
            //發出信號燈
            semaphore.signal()
        }
        print(stringValue)
        task.resume()
        //停止執行下面程式碼，等待信號燈
        semaphore.wait(timeout: .distantFuture)
        //print(stringValue)
        return stringValue
        
    }
    
    
    func uploadImage(URL: String,pic:UIImage,email: String,title: String, riddle: String){
        
        let myUrl = NSURL(string: URL)
        //let myUrl = NSURL(string: "http://www.boredwear.com/utils/postImage.php")
        
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "POST"
        
        let param = [
            "email"  : email,
            "title"    : title,
            "Riddle"    : riddle
        ]
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let imageData = UIImageJPEGRepresentation(pic, 1)
        
        if(imageData == nil)  { return }
        
        request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "file", imageDataKey: imageData! as NSData, boundary: boundary) as Data
        
        
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            // You can print out response object
            print("******* response = \(response)")
            
            // Print out reponse body
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****** response data = \(responseString!)")
            
            do {
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [[String : Any]]
                
                print("json\(json)")
                
                
                
            }catch
            {
                print(error)
            }
            
        }
        
        task.resume()
        //停止執行下面程式碼，等待信號燈
        //semaphore.wait(timeout: .distantFuture)
        
        
    }
    
    
    func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
        let body = NSMutableData();
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.appendString(string: "--\(boundary)\r\n")
                body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.appendString(string: "\(value)\r\n")
            }
        }
        
        let filename = "RiddleImage.jpg"
        let mimetype = "image/jpg"
        
        body.appendString(string: "--\(boundary)\r\n")
        body.appendString(string: "Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageDataKey as Data)
        body.appendString(string: "\r\n")
        
        
        
        body.appendString(string: "--\(boundary)--\r\n")
        
        return body
    }
    
    
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
    
    
    
    
}
extension NSMutableData {
    
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}

