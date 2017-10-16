//
//  LocalScene.swift
//  Riddle Me There
//
//  Created by admin on 2017/9/7.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import SpriteKit
import MapKit

var riddenumber: String!
class LocalScene: SKScene , MKMapViewDelegate , UITableViewDelegate, UITableViewDataSource{
    var sView : SKView?
    
    var localriddlesbtn : UIButton!
    var specialriddlesbtn : UIButton!
    var mapbtn : UIButton!
    var returnbtn : UIButton!
    
    var Lbtn: UIButton!
    var Mbtn: UIButton!
    var Sbtn: UIButton!
    
    
    var gameTableView = UITableView()
    var items: [String] = []
    var items2: [String] = []
    
    
    var myMapView = MKMapView()
    
    var riddleData = [RiddleData]()
    
    
    var locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func didMove(to view: SKView) {
        sView = self.view
        
        // background image
        let background = pos.imageclass(image: "Background-8", x: size.width/2, y: size.height/2,z:-1)
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
        
        // L button
        Lbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Lbtn.setBackgroundImage(UIImage(named: "L"), for: UIControlState.normal)
        Lbtn.addTarget(self,action: #selector(Lbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // M button
        Mbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Mbtn.setBackgroundImage(UIImage(named: "M"), for: UIControlState.normal)
        Mbtn.addTarget(self,action: #selector(Mbtnevent),for: .touchUpInside)//修改按鈕細節
        
        // S button
        Sbtn = UIButton(frame:CGRect(x: 40, y: 270, width: 75, height: 70))
        Sbtn.setBackgroundImage(UIImage(named: "S"), for: UIControlState.normal)
        Sbtn.addTarget(self,action: #selector(Sbtnevent),for: .touchUpInside)//修改按鈕細節
        
        //tableview
        
        self.gameTableView.delegate = self
        self.gameTableView.dataSource = self
        
        gameTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        gameTableView.frame=CGRect(x:20,y:50,width:280,height:200)
        gameTableView.backgroundColor = UIColor.clear
        
        
        
        
        locManager.requestWhenInUseAuthorization()
        
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locManager.location
            print("latitude :\(currentLocation.coordinate.latitude)")
            print("longitude :\(currentLocation.coordinate.longitude)")
        }
        
        
        
        myMapView.frame = CGRect(x: (sView?.bounds.width)!/2, y: (sView?.bounds.height)!/2, width: 100, height: 100)
        
        self.myMapView.delegate = self
        
        // 地圖樣式
        myMapView.mapType = .standard
        
        // 顯示自身定位位置
        myMapView.showsUserLocation = true
        
        // 允許縮放地圖
        myMapView.isZoomEnabled = true
        
        // 地圖預設顯示的範圍大小 (數字越小越精確)
        let latDelta = 0.05
        let longDelta = 0.05
        let currentLocationSpan:MKCoordinateSpan =
            MKCoordinateSpanMake(latDelta, longDelta)
        
        let center:CLLocation = CLLocation(
            latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
        let currentRegion:MKCoordinateRegion =
            MKCoordinateRegion(
                center: center.coordinate,
                span: currentLocationSpan)
        myMapView.setRegion(currentRegion, animated: true)
        
        // 加入到畫面中
        sView?.addSubview(myMapView)
        
        // add view
        sView?.addSubview(localriddlesbtn)
        sView?.addSubview(specialriddlesbtn)
        sView?.addSubview(mapbtn)
        sView?.addSubview(returnbtn)
        sView?.addSubview(Lbtn)
        sView?.addSubview(Mbtn)
        sView?.addSubview(Sbtn)
        sView?.addSubview(gameTableView)
        
        addChild(background)
        addChild(Creatimage)
        addChild(reelimage)
        
        
        //close auto layout
        localriddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        specialriddlesbtn.translatesAutoresizingMaskIntoConstraints = false
        mapbtn.translatesAutoresizingMaskIntoConstraints = false
        returnbtn.translatesAutoresizingMaskIntoConstraints = false
        Lbtn.translatesAutoresizingMaskIntoConstraints = false
        Mbtn.translatesAutoresizingMaskIntoConstraints = false
        Sbtn.translatesAutoresizingMaskIntoConstraints = false
        gameTableView.translatesAutoresizingMaskIntoConstraints = false
        myMapView.translatesAutoresizingMaskIntoConstraints = false
        //set auto layout
        pos.autoPosition(item1: localriddlesbtn, item2: sView!, topValue: view.bounds.height * 0.53, bottomValue: -(view.bounds.height * 0.47), leftValue: view.bounds.width * 0.77, rightValue: -(view.bounds.width * 0.23), widthValue: 0.21, heightValue: 0.12)
        
        pos.autoPosition(item1: specialriddlesbtn, item2: sView!, topValue: view.bounds.height * 0.68, bottomValue: -(view.bounds.height * 0.32), leftValue: view.bounds.width * 0.75, rightValue: -(view.bounds.width * 0.25), widthValue: 0.21, heightValue: 0.12)
        
        pos.autoPosition(item1: mapbtn, item2: sView!, topValue: view.bounds.height * 0.82, bottomValue: -(view.bounds.height * 0.18), leftValue: view.bounds.width * 0.78, rightValue: -(view.bounds.width * 0.22), widthValue: 0.1, heightValue: 0.11)
        
        pos.autoPosition(item1: returnbtn, item2: sView!, topValue: view.bounds.height * 0.05, bottomValue: -(view.bounds.height * 0.95), leftValue: view.bounds.width * 0.08, rightValue: -(view.bounds.width * 0.92), widthValue: 0.14, heightValue: 0.19)
        
        pos.autoPosition(item1: gameTableView, item2: sView!, topValue: view.bounds.height * 0.1, bottomValue: -(view.bounds.height * 0.9), leftValue: view.bounds.width * 0.29, rightValue: -(view.bounds.width * 0.71), widthValue: 0.4, heightValue: 0.8)
        
        pos.autoPosition(item1: Lbtn, item2: sView!, topValue: view.bounds.height * 0.46, bottomValue: -(view.bounds.height * 0.54), leftValue: view.bounds.width * 0.25, rightValue: -(view.bounds.width * 0.75), widthValue: 0.05, heightValue: 0.1)
        
        pos.autoPosition(item1: Mbtn, item2: sView!, topValue: view.bounds.height * 0.46, bottomValue: -(view.bounds.height * 0.54), leftValue: view.bounds.width * 0.15, rightValue: -(view.bounds.width * 0.85), widthValue: 0.05, heightValue: 0.1)
        
        pos.autoPosition(item1: Sbtn, item2: sView!, topValue: view.bounds.height * 0.45, bottomValue: -(view.bounds.height * 0.55), leftValue: view.bounds.width * 0.05, rightValue: -(view.bounds.width * 0.95), widthValue: 0.05, heightValue: 0.1)
        
        pos.autoPosition(item1: myMapView, item2: sView!, topValue: view.bounds.height * 0.55, bottomValue: -(view.bounds.height * 0.45), leftValue: view.bounds.width * 0.05, rightValue: -(view.bounds.width * 0.95), widthValue: 0.25, heightValue: 0.30)
        
        
    }
    
    // local riddles button event
    @objc func localriddlesbtnevent(sender:UIButton){
        
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
    
    
    // L button event
    @objc func Lbtnevent(sender:UIButton){
        print(currentLocation.coordinate.latitude)
        print(currentLocation.coordinate.longitude)
        var postvalue = "email=\(account!)&lat=\(currentLocation.coordinate.latitude)&lon=\(currentLocation.coordinate.longitude)&range=large"
        let riddlejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchriddle.php", valuedata: postvalue)
        
        
        var jsoncount = riddlejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            let riddledata = RiddleData()
            riddledata.title = riddlejson[jsonIndex]["title"] as! String
            riddledata.riddle = riddlejson[jsonIndex]["riddle"] as! String
            riddledata.riddleid = riddlejson[jsonIndex]["id"] as! String
            riddledata.lat = Double(riddlejson[jsonIndex]["lat"] as! String)!
            riddledata.lon = Double(riddlejson[jsonIndex]["lon"] as! String)!
            self.riddleData.append(riddledata)
        }
        
        
        
        
        for index in 0 ..< self.riddleData.count {
            self.items.append(self.riddleData[index].title)
            self.items2.append(self.riddleData[index].riddle)
            var objectAnnotation = MKPointAnnotation()
            objectAnnotation.coordinate = CLLocation(
                latitude: self.riddleData[index].lat,
                longitude: self.riddleData[index].lon).coordinate
            objectAnnotation.title = self.riddleData[index].title
            objectAnnotation.subtitle = self.riddleData[index].riddle
            myMapView.addAnnotation(objectAnnotation)
        }
        
        
        
        gameTableView.reloadData()
        
    }
    
    // M button event
    @objc func Mbtnevent(sender:UIButton){
        print("M")
        
        var postvalue = "email=\(account!)&lat=\(currentLocation.coordinate.latitude)&lon=\(currentLocation.coordinate.longitude)&range=medium"
        let riddlejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchriddle.php", valuedata: postvalue)
        
        
        var jsoncount = riddlejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            let riddledata = RiddleData()
            riddledata.title = riddlejson[jsonIndex]["title"] as! String
            riddledata.riddle = riddlejson[jsonIndex]["riddle"] as! String
            riddledata.riddleid = riddlejson[jsonIndex]["id"] as! String
            riddledata.lat = Double(riddlejson[jsonIndex]["lat"] as! String)!
            riddledata.lon = Double(riddlejson[jsonIndex]["lon"] as! String)!
            self.riddleData.append(riddledata)
        }
        
        
        
        
        for index in 0 ..< self.riddleData.count {
            self.items.append(self.riddleData[index].title)
            self.items2.append(self.riddleData[index].riddle)
            var objectAnnotation = MKPointAnnotation()
            objectAnnotation.coordinate = CLLocation(
                latitude: self.riddleData[index].lat,
                longitude: self.riddleData[index].lon).coordinate
            objectAnnotation.title = self.riddleData[index].title
            objectAnnotation.subtitle = self.riddleData[index].riddle
            myMapView.addAnnotation(objectAnnotation)
        }
        
        
        
        gameTableView.reloadData()
    }
    
    // S button event
    @objc func Sbtnevent(sender:UIButton){
        print("S")
        
        var postvalue = "email=\(account!)&lat=\(currentLocation.coordinate.latitude)&lon=\(currentLocation.coordinate.longitude)&range=small"
        let riddlejson = DatabasePost().postDatabase(URL: "http://140.131.12.56/swift/searchriddle.php", valuedata: postvalue)
        
        
        var jsoncount = riddlejson.count
        
        for jsonIndex in 0 ..< jsoncount{
            let riddledata = RiddleData()
            riddledata.title = riddlejson[jsonIndex]["title"] as! String
            riddledata.riddle = riddlejson[jsonIndex]["riddle"] as! String
            riddledata.riddleid = riddlejson[jsonIndex]["id"] as! String
            riddledata.lat = Double(riddlejson[jsonIndex]["lat"] as! String)!
            riddledata.lon = Double(riddlejson[jsonIndex]["lon"] as! String)!
            self.riddleData.append(riddledata)
        }
        
        
        
        
        for index in 0 ..< self.riddleData.count {
            self.items.append(self.riddleData[index].title)
            self.items2.append(self.riddleData[index].riddle)
            var objectAnnotation = MKPointAnnotation()
            objectAnnotation.coordinate = CLLocation(
                latitude: self.riddleData[index].lat,
                longitude: self.riddleData[index].lon).coordinate
            objectAnnotation.title = self.riddleData[index].title
            objectAnnotation.subtitle = self.riddleData[index].riddle
            myMapView.addAnnotation(objectAnnotation)
        }
        
        
        
        gameTableView.reloadData()
    }
    
    
    
    
    func remove() {
        
        localriddlesbtn.removeFromSuperview()
        specialriddlesbtn.removeFromSuperview()
        mapbtn.removeFromSuperview()
        returnbtn.removeFromSuperview()
        Sbtn.removeFromSuperview()
        Mbtn.removeFromSuperview()
        Lbtn.removeFromSuperview()
        myMapView.removeFromSuperview()
        gameTableView.removeFromSuperview()
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //欄位數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //設定欄位高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 70.0;//Choose your custom row height
    }
    
    //欄位的內容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        //欄位背景透明化
        cell.backgroundColor = UIColor.clear
        
        //原本預設numberOfLines = 1 , 0可以設定無限行數
        cell.textLabel?.numberOfLines = 0
        
        //將陣列面的值插入到tableview的欄位裡
        cell.textLabel?.text = "Title : \(self.items[indexPath.row])\nRiddle :\(self.items2[indexPath.row])"
        cell.textLabel?.textAlignment = .justified
        //cell.textLabel?.frame = CGRect(x: 100, y: 30, width: 200, height: 50)
        
        //欄位前面的圖片
        var imageName = UIImage(named: "Select button icon")
        cell.imageView?.image = imageName
        
        //cell.layer.backgroundColor = UIColor.clear.cgColor
        //cell.contentView.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    
    //標題欄位
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "title"
    }
    
    //選擇到的欄位
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        riddenumber = self.riddleData[indexPath.row].riddleid
        //LocalScene().nextScene()
        composer.NextScene(nextScene: AnswerScene(size: (sView?.bounds.size)!),view: &sView!)
        remove()
    }
}

