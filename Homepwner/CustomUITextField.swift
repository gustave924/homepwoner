//
//  CustomUITextField.swift
//  Homepwner
//
//  Created by Ahmed Aboelela on 7/10/19.
//  Copyright © 2019 Ahmed Aboelela. All rights reserved.
//

import UIKit

class CustomUITextField: UITextField{
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        self.borderStyle = .bezel
        return true
    }
    
    
    override func resignFirstResponder() -> Bool {
        super.resignFirstResponder()
        self.borderStyle = .roundedRect
        return true
    }
}
