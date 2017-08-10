//
//  DatabasePost.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/14.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation

class DatabasePost {
    
    var splitedArray = Array<String>()
    func postDatabase(URL: String,valuedata: String,method: Int) -> Country{
        var stringValue : Country!
        var names = [String]()
        var chnames = [String]()
        var abbnames = [String]()
        var arrayvalue4 = [String]()
        var values = ""
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
                let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions()) as? [AnyObject]
                print("json : \(json)")
                if (method == 1 ){
                    
                    for jsons in json!! {
                        if let name = jsons["name"] as? String {
                            if let chname = jsons["ch_name"] as? String {
                                if let abbname = jsons["abb_name"] as? String {
                                    names.append(name)
                                    chnames.append(chname)
                                    abbnames.append(abbname)
                                    let user = Country(name: names, chname: chnames, abbname: abbnames, value4: arrayvalue4, value: "")
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
                                        let user = Country(name: names, chname: chnames, abbname: abbnames, value4: arrayvalue4, value: "")
                                        stringValue = user
                                    }
                                }
                            }
                        }
                    }
                }
                
                /*for jsons in json!! {
                 if let name = jsons[1] as? String {
                 names.append(name)
                 let user = Country.init(name: names, chname: chnames, abbname: abbnames)
                 stringValue = user
                 
                 }
                 }*/
            }
            
            
            
            print("response = \(String(describing: response))")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            //print("responseString = \(String(describing: responseString))")
            
            print("data : \(String(describing: data))")
            if (method == 2){
                if let stringData = String(data: data!, encoding: String.Encoding.utf8) {
                    print("stringData : \(stringData)") //JSONSerialization
                    //self.splitedArray = stringData.components(separatedBy:",")
                    //print("splitedArray : \(self.splitedArray)")
                    let user = Country(name: names, chname: chnames, abbname: abbnames, value4: arrayvalue4, value: stringData)
                    stringValue = user
                }
            }
            
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
    
}

