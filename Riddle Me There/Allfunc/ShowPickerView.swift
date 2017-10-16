//
//  ShowPickerView.swift
//  Riddle Me There
//
//  Created by admin on 2017/7/25.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit

class ShowPickerView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pick : UIPickerView = UIPickerView()
    var country = [String]()
    
    
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
        
        return country.count
        
        
    }
    
    // UIPickerView 每個選項顯示的資料
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 設置第一列時
        /*if component == 0 {
         // 設置標題文字
         return "Language"
         }*/
        
        // 否則就是設置第二列
        // 設置為陣列 languageTitle 的第 row 項資料
        
        self.pick = pickerView
        return country[row]
        
    }
    
    
    
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryVauleString = country[row]
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


