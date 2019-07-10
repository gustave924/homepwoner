//
//  Item.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/8/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding{
    
    let NAME = "NAME"
    let VALUE_IN_DOLLARS = "valueInDollars"
    let SERIAL_NUMBER = "serialNumber"
    let DATE_CREATED = "dateCreated"
    let IMAGE_ID = "imageId"
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let imageId: String
    
   
    
    init(name: String, valueInDollars: Int, serialNumber: String?){
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.imageId = UUID().uuidString
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if(random){
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var idx = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(idx)]
            idx = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(idx)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber =
                UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName,
                      valueInDollars: randomValue,
                      serialNumber: randomSerialNumber)
        }else{
            self.init(name:"", valueInDollars: 0, serialNumber:nil)
        }
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: NAME)
        aCoder.encode(valueInDollars, forKey: VALUE_IN_DOLLARS)
        aCoder.encode(serialNumber, forKey: SERIAL_NUMBER)
        aCoder.encode(dateCreated, forKey: DATE_CREATED)
        aCoder.encode(imageId, forKey: IMAGE_ID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: NAME) as! String
        valueInDollars = aDecoder.decodeInteger(forKey: VALUE_IN_DOLLARS)
        serialNumber = aDecoder.decodeObject(forKey: SERIAL_NUMBER) as! String
        dateCreated = aDecoder.decodeObject(forKey: DATE_CREATED) as! Date
        imageId = aDecoder.decodeObject(forKey: IMAGE_ID) as! String
        
        super.init()
    }
}
