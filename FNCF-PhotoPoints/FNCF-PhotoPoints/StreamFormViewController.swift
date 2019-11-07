//
//  StreamFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class StreamFormViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var Submitter: PhotoRepository!
   
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
        
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Submitter = PhotoDataRepository()
        
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")  // set datpicker text color
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        // Do any additional setup after loading the view.
    }
    
    var myStream: Int?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet var Date: UITextField!
    @IBOutlet var StreamHeight: UITextField!
    @IBOutlet var Weather: UITextField!
    @IBOutlet weak var StreamLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var btnImage: RoundButton!  //chris: for adding image to button background
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Submitter = PhotoDataRepository()
        
        // Do any additional setup after loading the view.
        
        //QR scanning and segue logic
        if(myStream != nil){
            var temp = String(StreamLabel.text!)
            let streamId = myStream! as NSNumber
            temp = "#" + streamId.stringValue
            StreamLabel.text = temp
        }
    }
    
    @IBAction func OpenCamera(_ sender: Any) {
        
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
        btnImage.setImage(image, for: .normal)   //set button background image
        
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    
    @IBAction func SubmitInfo(_ sender: Any) {

        let DateSubmit = Date.text!;
        let WeatherSubmit = Weather.text!;
        let HeightSubmit = StreamHeight.text!;
        
        
        let SubmitData = StreamSubmission(Date: DateSubmit, Weather: WeatherSubmit, StreamHeight: HeightSubmit)
        
        Submitter.add(newPhoto: SubmitData);
        
        Date.text = " "
        Weather.text = " "
        StreamHeight.text = " "
        ImageView.image = nil
        
       self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
        let Confirmed = UIAlertController(title: "Information has been submitted", message: "Thank you for your submission" , preferredStyle: .actionSheet)
        
        addActionSheetForiPad(actionSheet: Confirmed)
        
        Confirmed.addAction(UIAlertAction(title: "Close", style: .default , handler: nil))
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
