//
//  PlantFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/28/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class PlantFormViewController: UIViewController {

    var Submiter:PhotoRepository!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Submiter = PhotoDataRepository();
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var FoliageEntered: UITextField!
    @IBOutlet var DateEntered: UITextField!
    @IBOutlet var FruitChoice: UITextField!
    
// @IBOutlet var AdditionalComments: UITextView!
    
    @IBAction func SubmitLogic(_ sender: Any) {
        
        let alert = UIAlertController(title: "Submit a Photo", message: "Would you like to open the camera, or submit from gallery" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { ACTION in
            self.DateEntered.text = "You it worked"
        }))
        
        alert.addAction(UIAlertAction(title: "Pull From Gallery", style: .default, handler: { ACTION in
            self.FruitChoice.text = "You it worked"
        }))
        
        
        self.present(alert,animated: true)
    }
    /*          BluePrint
     Date
     Folliage
     Fruit
     AdditionalComments
                            */
    @IBAction func SubmitData(_ sender: Any) {
       
        let DateChosen = DateEntered.text!;
        let Fruit = FruitChoice.text!
        let Folliage = FoliageEntered.text!
        let comments = "AdditionalComments.text"
        
        let SubmitData = PlantSubmission(Date: DateChosen, Fruit: Fruit, Foliage: Folliage, AdditionalComments: comments)
        Submiter.add(newPhoto: SubmitData)
        
        DateEntered.text = " "
        FruitChoice.text = " "
        FoliageEntered.text = " "
    // AdditionalComments.text = " "
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    
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
