//
//  DataFile.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/17.
//  Copyright © 2017年 admin. All rights reserved.
//

import Foundation
import UIKit

class DataFile {
    
    func save(image: UIImage){
        let fileURL = getDocumentsDirectory().appendingPathComponent("myphoto.png")
        if let pngImageData = UIImagePNGRepresentation(image) {
            try? pngImageData.write(to: fileURL)
        }
    }
    
    func read() -> UIImage {
        let fileURL = getDocumentsDirectory().appendingPathComponent("myphoto.png")
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)!
        } catch {
            print("Error loading image : \(error)")
            return UIImage()
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
