//
//  ScanController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/25/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import AVFoundation
import UIKit

class QRScanner: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    private let supportedCodeTypes = [AVMetadataObject.ObjectType.qr]
    
    let pm = PlantManager()
    var plant: Plant!
    
    @IBOutlet var messageLabel:UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
        
        
        guard let captureDevice = deviceDiscoverySession.devices.first else {
            print("Failed to get the camera device")
            return
        }
          
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            self.captureSession.addInput(input)
            
            let captureMetadataOutput = AVCaptureMetadataOutput()
            self.captureSession.addOutput(captureMetadataOutput)
            
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
        } catch {
            // If any error occurs, simply print it out and don't continue any more
            print(error)
            return;
        }
            
        // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
        self.videoPreviewLayer = AVCaptureVideoPreviewLayer(session: self.captureSession)
        self.videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        self.videoPreviewLayer?.frame = self.view.layer.bounds
        self.view.layer.addSublayer(self.videoPreviewLayer!)
            
        // Start video capture.
        self.captureSession.startRunning()
        
        //Move the message label to the front
        view.bringSubviewToFront(messageLabel)
            
        // Initialize QR Code Frame to highlight the QR code
        self.qrCodeFrameView = UIView()
            
        if let qrCodeFrameView = self.qrCodeFrameView {
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
            qrCodeFrameView.layer.borderWidth = 2
            self.view.addSubview(qrCodeFrameView)
            self.view.bringSubviewToFront(qrCodeFrameView)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            messageLabel.text = "No QR code is detected"
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == AVMetadataObject.ObjectType.qr {
            // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
            let barCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metadataObj)
            qrCodeFrameView?.frame = barCodeObject!.bounds
            
            
            //For now just display the extracted value
            if metadataObj.stringValue != nil {
                messageLabel.text = metadataObj.stringValue
                
                //get the plant by name from QR Code
                //TODO: If QR Codes are not the plant name in "Xxxxx Xxxx" format then this logic needs to be changed
                plant = pm.getPlantByName(name: metadataObj.stringValue!)
                
                //check that the plant was found, if it wasnt then plant.id = -1
                if(plant.plantID != -1)
                {
                    //Plant was found
                    //Call segue to plant list
                    guard let vc = UIStoryboard(name: "PlantInfoStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "PlantInfoStoryBoard") as?
                        PlantInfoViewController else{
                            print("Could not instantiate view controller with indentifier of type PlantInfoStoryBoard")
                            return
                    }
                    /*
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "plantInfoSegue", sender: self.plant)
 */
                    }
                }
                else{
                    let alertController = UIAlertController(title: "Scan Error", message:
                        "Failed to retrieve plant info from QR Code value", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
/*
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "plantInfoSegue"){
            let vc = segue.destination as! PlantInfoViewController
            vc.myPlant = plant
        }
    }
*/
