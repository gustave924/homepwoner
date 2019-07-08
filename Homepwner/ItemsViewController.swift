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
       
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        let footerView = UITextView(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        footerView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15)
        footerView.textAlignment = .center
        footerView.autoresizingMask = [.flexibleWidth, .flexibleLeftMargin, .flexibleRightMargin]
        footerView.text = "No more items"
        footerView.isEditable = false
        tableView.tableFooterView = footerView
    }
    
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = itemStore.items[indexPath.row]
        if editingStyle == .delete{
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let actionSheetAlert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheetAlert.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
                
                self.itemStore.deleteItem(item: item)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            actionSheetAlert.addAction(deleteAction)
            
            present(actionSheetAlert, animated: true, completion: nil)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
        print(destinationIndexPath.row)
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if(tableView.isEditing){
            sender.setTitle("Edit", for: .normal)
        }else{
            sender.setTitle("Done", for: .normal)
        }
        tableView.isEditing = !tableView.isEditing
    }
    
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let item = itemStore.createItem()
        if let itemIndex = itemStore.items.firstIndex(of: item){
            let indexPath = IndexPath(row: itemIndex, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
}
