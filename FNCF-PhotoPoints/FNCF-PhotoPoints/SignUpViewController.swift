//
//  SignUpViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 5/7/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
    
    var validation = DbOperations()
    
    @IBOutlet var Email: UITextField!
    
    @IBOutlet var Back: UIButton!
    
    @IBOutlet var ErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submitBtn(_ sender: Any) {
        
        if(Email.text! == validation.get(indentifier: Email.text!)!)
       {
        ErrorMessage.text = "Account Login Successful"
        
        ErrorMessage.textColor = UIColor.black
        
        ErrorMessage.isHidden = false
        
        
        Back.isHidden = false
        
        
        }
       else {
            ErrorMessage.isHidden = false;
        }
        
    }
   
    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
     func Myunwinder(unwindsegue: UIStoryboardSegue){
        print("all done" )
    }
}

