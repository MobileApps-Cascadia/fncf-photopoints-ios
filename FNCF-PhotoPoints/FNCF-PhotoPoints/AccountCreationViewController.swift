//
//  AccountCreationViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 11/5/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit
import CoreData

class AccountCreationViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var User = DbOperations()
   
    @IBOutlet weak var FirstNameSubmit: UITextField!
    @IBOutlet var LastNameSubmit: UITextField!
    @IBOutlet weak var EmailSubmit: UITextField!
    @IBOutlet weak var PasswordSubmit: UITextField!
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ACSubmit(_ sender: Any) {
        
        let FirstName = FirstNameSubmit.text!
        let LastName = LastNameSubmit.text!
        let Email = EmailSubmit.text!
        let Password = PasswordSubmit.text!
        
        User.add(firstName: FirstName, lastName: LastName, email: Email, password: Password)
        
        let test = User.get(indentifier: Email)
        
        print(test!)
        
        //May need this to check user unique device string
        /*if let uuid = UIDevice.current.identifierForVendor?.uuidString {
        print(uuid)
    }
        */
        
        dismiss(animated: true, completion: nil)
    }
}
