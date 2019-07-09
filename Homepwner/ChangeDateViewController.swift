//
//  ChangeDateViewController.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/10/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class ChangeDateViewController: UIViewController {

    var item : Item!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        datePicker.setDate(item.dateCreated, animated: true)
    }
    

    @IBAction func save(_ sender: UIButton) {
        item.dateCreated = datePicker.date
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        item.dateCreated = datePicker.date
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
