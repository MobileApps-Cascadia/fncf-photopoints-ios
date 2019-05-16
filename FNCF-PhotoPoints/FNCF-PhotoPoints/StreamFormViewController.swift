//
//  StreamFormViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class StreamFormViewController: UIViewController {

    var Submitter: PhotoRepository!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Submitter = PhotoDataRepository()
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var Date: UITextField!
    @IBOutlet var StreamHeight: UITextField!
    @IBOutlet var Weather: UITextField!
   
    
    @IBAction func OpenCamera(_ sender: Any) {
        
        let alert = UIAlertController(title: "Submit a Photo", message: "Would you like to open the camera, or submit from gallery" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { ACTION in
            self.Date.text = "You it worked"
        }))
        
        alert.addAction(UIAlertAction(title: "Pull From Gallery", style: .default, handler: { ACTION in
            self.StreamHeight.text = "You it worked"
        }))
        
        
        self.present(alert,animated: true)
        
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
