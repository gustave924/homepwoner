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
        return cache.object(forKey: id as NSString)
    }
}
