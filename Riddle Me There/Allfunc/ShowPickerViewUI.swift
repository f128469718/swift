//
//  ShowPickerView.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit

class ShowPickerViewUI: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pick : UIPickerView = UIPickerView()
    var country = [String]()
    var rowString = ["female","male"]
    
    var countryVauleString = "Test"
    
    // UIPickerViewDataSource 必須實作的方法：UIPickerView 有幾列可以選擇
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewDataSource 必須實作的方法：UIPickerView 各列有多少行資料
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 設置第一列時
        /*if component == 0 {
         // 返回成員數量
         return 1
         }*/
        
        // 否則就是設置第二列
        // 返回字典 language 的成員數量
        
        return 2
        
        
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var myImageView = UIImageView()
        
        
        
        switch row {
        case 0:
            myImageView = UIImageView(image: UIImage(named:"female"))
        case 1:
            myImageView = UIImageView(image: UIImage(named:"male"))
        default:
            myImageView.image = nil
        }
        
        
        
        return myImageView
    }
    
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        countryVauleString = rowString[row]
        // 第一列只有一項資料，所以直接離開
        if component == 0 { return }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func ArrayInit()  {
        //self.languageTitle = [String](language.keys)
    }
    
    func hide(){
        pick.isHidden = !pick.isHidden
    }
    
}


