//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/8/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {

    var itemStore: ItemStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let inset = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = inset
        tableView.scrollIndicatorInsets = inset*/
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        itemStore.createItem()
        
        tableView.reloadData()
        
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemStore.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = itemStore.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UIViewTableCell", for: indexPath)
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.valueInDollars)"
        return cell
    }

    

    

}
