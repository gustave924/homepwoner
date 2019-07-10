//
//  ImageStore.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/10/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class ImageStore{
    let cache = NSCache<NSString, UIImage>()
    
    func setImage(id: String, image: UIImage){
        cache.setObject(image, forKey: id as NSString)
    }
    
    func deleteImage(id: String){
        cache.removeObject(forKey: id as NSString)
    }
    
    func getImage(id: String) -> UIImage?{
        if let exisitingImage = cache.object(forKey: id as NSString){
            return exisitingImage
        }
        
        let url = imageURl(forKey: id)
        guard let imageAtDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        cache.setObject(imageAtDisk, forKey: id as NSString)
        return imageAtDisk
    }
    
    func imageURl(forKey key: String) -> URL{
        let dirs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dir = dirs.first!
        return dir.appendingPathComponent(key)
    }
    
    func setImage(_ image: UIImage, forKey key:String){
        let url = imageURl(forKey: key)
        let imageData = image.jpegData(compressionQuality: 0.5)
        do{
            try imageData?.write(to: url)
        }catch{
            print("Error occured: \(error)")
        }
        
    }
    
    func deleteImage(forKey key:String){
        
        cache.removeObject(forKey: key as NSString)
        
        let url = imageURl(forKey: key)
        do{
            try FileManager.default.removeItem(at: url)
        }catch{
            print("Error occured: \(error)")
        }
        
        
    }
}
