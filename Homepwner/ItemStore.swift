//
//  ItemStore.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/8/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class ItemStore{
    var items = [Item]()
    let itemArchiveURL: URL = {
       let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }()
    
    init(){
        if let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item]{
            items = archivedItems
        }
    }
    
    
    @discardableResult func createItem() -> Item{
        let item = Item(random: true)
        items.append(item)
        return item
    }
    
    func deleteItem(item: Item){
        if let index = items.firstIndex(of: item){
             items.remove(at: index)
        }
    }
    
    func moveItem(from: Int, to: Int){
        let item = items[from]
        items.remove(at: from)
        items.insert(item, at: to)
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(itemArchiveURL.path) ")
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            try data.write(to: itemArchiveURL)
            return true
        }catch{
            print("Error: \(error)")
            return false
        }
        
       //return NSKeyedArchiver.archiveRootObject(items, toFile: itemArchiveURL.path)
    }
}
