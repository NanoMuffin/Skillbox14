//
//  ViewController.swift
//  Skillbox14
//
//  Created by Александр Сорока on 14.04.2020.
//  Copyright © 2020 Александр Сорока. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var familyNameTextField: UITextField!
    
    
    var link = StoredData.Data
    
    
    @IBAction func saveButton(_ sender: Any) {
        link.userName = nameTextField.text
        link.userFamilyName = familyNameTextField.text
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        dataLabel.text = "\(link.userName!) \(link.userFamilyName!)"
    }


}

