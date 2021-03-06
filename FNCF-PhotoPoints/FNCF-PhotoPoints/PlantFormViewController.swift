//
//  PlantFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/28/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class PlantFormViewController: UIViewController ,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate {

    var Submiter:PhotoRepository!
    var myPlant: Plant!

    
    @IBOutlet weak var PlantInfo: UILabel!
    @IBOutlet weak var MoreInfo: UITextView!
    @IBOutlet var FoliageEntered: UITextField!
    @IBOutlet var DateEntered: UITextField!
    @IBOutlet var FruitChoice: UITextField!
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var btnImage: RoundButton!     // chris: added button outlet used mostly for setting propertys
    // @IBOutlet var AdditionalComments: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(myPlant == nil)
        {
            myPlant = Plant(plantID: -1, name: "Plant", latinName: "Plant", desc: "Plant")
        }
        
        PlantInfo.text = myPlant.name + "Form"
        
        Submiter = PhotoDataRepository();
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        
        
        // chris: for dismising device keybord
       // DateEntered.delegate = self
        //FoliageEntered.delegate = self
        //FruitChoice.delegate = self
        
        
        
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    //@IBOutlet weak var MoreInfo: TextView!
    //@IBOutlet var FoliageEntered: UITextField!
    //@IBOutlet var DateEntered: UITextField!
    //@IBOutlet var FruitChoice: UITextField!
    //@IBOutlet weak var ImageView: UIImageView!
    
    //@IBOutlet weak var btnImage: RoundButton!     // chris: for adding image to button background
    // @IBOutlet var AdditionalComments: UITextView!
    
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
        
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }
    
    
    
    //chris:
    //Camera button Logic :TODO change code so that image
    //view displays popover and when picture is selected still
    // displayes in appropreat place. : Done**
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
        
        //ImageView.image = image
        btnImage.setBackgroundImage(image, for: .normal) // set background image to button
        
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
        
        DateEntered.text = " "
        FruitChoice.text = " "
        FoliageEntered.text = " "
    // AdditionalComments.text = " "
        
        let Confirmed = UIAlertController(title: "Information has been submitted", message: "Thank you for your submission" , preferredStyle: .actionSheet)
        
        addActionSheetForiPad(actionSheet: Confirmed)
        
        Confirmed.addAction(UIAlertAction(title: "Ok", style: .default , handler: nil))
        
        
        
        DateEntered.text = " "
        FruitChoice.text = " "
        FoliageEntered.text = " "
        ImageView.image = nil;
        

        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        self.present(Confirmed, animated: true,completion: nil)
    
    }
    
    @IBAction func FoliageCheckbox(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
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

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//chris:  to remove device keybord apon enter button press
//extension ViewController : UITextFieldDelegate{
    
  //  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    //    textField.resignFirstResponder()
      //  return true
   // }

//}

