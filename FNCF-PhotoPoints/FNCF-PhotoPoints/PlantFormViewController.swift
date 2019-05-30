//
//  PlantFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/28/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit


class PlantFormViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    var Submiter:PhotoRepository!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Submiter = PhotoDataRepository();
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var FoliageEntered: UITextField!
    @IBOutlet var DateEntered: UITextField!
    @IBOutlet var FruitChoice: UITextField!
    
// @IBOutlet var AdditionalComments: UITextView!
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
      
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }
    
    
    @IBAction func SubmitLogic(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        
      

        
        let actionsheet = UIAlertController(title: "Photo Source", message: "choose a source", preferredStyle: .actionSheet)
        
        addActionSheetForiPad(actionSheet: actionsheet)
        
        actionsheet.addAction(UIAlertAction(title: "Camera", style: .default , handler: {(action:UIAlertAction) in
            
            imagePickerController.sourceType = .camera
            self.present(imagePickerController,animated: true,completion: nil)
            
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: {(action:UIAlertAction) in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController,animated: true,completion: nil)
        }))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
        
        self.present(actionsheet, animated: true,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        ImageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
        
        
        let Confirmed = UIAlertController(title: "Information has been submitted", message: "Thank you for your submission" , preferredStyle: .actionSheet)
        
        addActionSheetForiPad(actionSheet: Confirmed)
        
         Confirmed.addAction(UIAlertAction(title: "Ok", style: .default , handler: nil))
        
        
        
        DateEntered.text = " "
        FruitChoice.text = " "
        FoliageEntered.text = " "
        ImageView.image = nil;
        
    // AdditionalComments.text = " "
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    
        
        self.present(Confirmed, animated: true,completion: nil)
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
