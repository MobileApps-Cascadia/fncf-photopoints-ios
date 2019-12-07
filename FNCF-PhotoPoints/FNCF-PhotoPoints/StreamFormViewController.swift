//
//  StreamFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class StreamFormViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    var Submitter: PhotoRepository!
   
    
    public func addActionSheetForiPad(actionSheet: UIAlertController) {
        
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }

   
    
    var myStream: Int?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var streamHeightPicker: UIPickerView!
    var streamHeightPickerData:[String] = [String]()
    
    @IBOutlet var Date: UITextField!
    //@IBOutlet var StreamHeight: UITextField!
    @IBOutlet var Weather: UITextField!
    @IBOutlet weak var StreamLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBOutlet weak var btnImage: RoundButton!  //chris: for adding image to button background
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Submitter = PhotoDataRepository()
        
        
        // connect data for stream height picker
        self.streamHeightPicker.delegate = self
        self.streamHeightPicker.dataSource = self
        
        
        
        // input data into streamHeightPickerData array
        streamHeightPickerData = ["1in " , "2in" , "3in" , "4in" , "5in" , "6in" , "7in" , "8in" , "9in" , "10in" , "11in" , "12in" , "13in" , "14in" , "15in" , "16in" , "17in" , "18in"]
        
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")  // set datpicker text color
        datePicker.setValue(false, forKeyPath: "highlightsToday")
        
        
        
        streamHeightPicker.setValue(UIColor.white, forKeyPath : "textColor")
        //streamHeightPicker.setValue(false, forKeyPath: "highlightsToday")
        
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
        let HeightSubmit = streamHeightPicker.dataSource;
        
        
        let SubmitData = StreamSubmission(Date: DateSubmit, Weather: WeatherSubmit, StreamHeight: HeightSubmit as! String)
        
        Submitter.add(newPhoto: SubmitData);
        
        Date.text = " "
        Weather.text = " "
        streamHeightPicker.dataSource = " " as? UIPickerViewDataSource
        ImageView.image = nil
        
       self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
        let Confirmed = UIAlertController(title: "Information has been submitted", message: "Thank you for your submission" , preferredStyle: .actionSheet)
        
        addActionSheetForiPad(actionSheet: Confirmed)
        
        Confirmed.addAction(UIAlertAction(title: "Close", style: .default , handler: nil))
        self.present(Confirmed, animated: true,completion: nil)

        
    }
    
    // stream height picker num columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // stream height picker num rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return streamHeightPickerData.count
    }
    //data to return for the row and the column thats being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return streamHeightPickerData[row]
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
