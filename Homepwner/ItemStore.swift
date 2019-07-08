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
    
    @discardableResult func createItem() -> Item{
        let item = Item(random: true)
        items.append(item)
        return item
    }
}
