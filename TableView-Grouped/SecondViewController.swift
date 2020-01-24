//
//  SecondViewController.swift
//  TableView-Grouped
//
//  Created by Marni Anuradha on 12/28/19.
//  Copyright © 2019 Marni Anuradha. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fillTextFields()
        
        nameTF.keyboardType = .asciiCapable
        ageTF.keyboardType = .numberPad
        emailTF.keyboardType = .emailAddress
        // Do any additional setup after loading the view.
    }
    
    func fillTextFields()
    {
        if let index = ViewController.rowIndex
        {
            nameTF.text = ViewController.name[index]
            emailTF.text = ViewController.email[index]

            ageTF.text = String(ViewController.age[index])
        }
    }
    
    
    @IBAction func onSaveBtnTap(_ sender: UIButton) {
        
        if(ViewController.rowIndex == nil)
        {
            if(segmentedControl.selectedSegmentIndex == 0)
            {
                CRUD.insertValue(entitiyName: "Contacts", key1: "name", value1: nameTF.text!, key2: "email", value2: emailTF.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "designation", value4: "Actors")
            }
            
            else if(segmentedControl.selectedSegmentIndex == 1)
            {
                CRUD.insertValue(entitiyName: "Contacts", key1: "name", value1: nameTF.text!, key2: "email", value2: emailTF.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "designation", value4: "Cricketers")

            }
            
            else{
                CRUD.insertValue(entitiyName: "Contacts", key1: "name", value1: nameTF.text!, key2: "email", value2: emailTF.text!, key3: "age", value3: Int16(ageTF.text!)!, key4: "designation", value4: "Politicians")

            }



        }
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
