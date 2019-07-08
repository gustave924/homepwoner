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
    var itemsLessThan50 = [Item]()
    var itemsMoreThan50 = [Item]()
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
        tableView.rowHeight = 60
        let footerView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        footerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        footerView.textAlignment = .center
        footerView.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleRightMargin]
        
        
        footerView.text = "No more items!"
        footerView.font = UIFont(name:"Arial", size: 18)
        
        tableView.tableFooterView = footerView
        
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
        
        itemStore.items.forEach { (item) in
            if(item.valueInDollars >= 50){
                itemsMoreThan50.append(item)
            }else{
                itemsLessThan50.append(item)
            }
        }
        tableView.reloadData()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let num =  section == 0 ?itemsLessThan50.count : itemsMoreThan50.count
        return num
    }
    
    
   

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "Economy items" : "Fancy items"
        return title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let item = itemsLessThan50[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "UIViewTableCell", for: indexPath)
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            let font = UIFont(name: "Arial", size: 20)
            cell.textLabel?.font = font
            cell.detailTextLabel?.font = font
            return cell
        }else{
            let item = itemsMoreThan50[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "UIViewTableCell", for: indexPath)
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = "$\(item.valueInDollars)"
            return cell
        }
        
    }

    

    

}
