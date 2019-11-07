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
    var streamId: Int!
    
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
                //NOTE: The following switch statement is for the URL based QR Code
                // Example of QR code for Plants "https://www.plantsmap.com/organizations/24477/plants/28066"
                // Examp of QR code for Streams "STREAM/00001"
                var myString:String = ""
                let urlID = metadataObj.stringValue?.suffix(5)
                myString = String(urlID!)
                let lastFive = (myString.suffix(53) as NSString).integerValue
                
                var plantId = -1;
                streamId = -1;
                
                switch (lastFive) {
                //Stream Cases
                case 00001: streamId = 1; //Stream point 1
                break;
                case 00002: streamId = 2; //Stream point 2
                break;
                case 00003: streamId = 3; //Stream point 3
                break;
                case 00004: streamId = 4; //Stream point 4
                break;
                case 00005: streamId = 5; //Stream point 5
                break;
                case 00006: streamId = 6; //Stream point 6
                break;
                case 00007: streamId = 7; //Stream point 7
                break;
                case 00008: streamId = 8; //Stream point 8
                break;
                case 00009: streamId = 9; //Stream point 9
                break;
                case 00010: streamId = 10; //Stream point 10
                break;
                case 00011: streamId = 11; //Stream point 11
                break;
                case 00012: streamId = 12; //Stream point 12
                break;
                    
                //Plant Cases
                case 28092: plantId = 1; //Douglas Fir
                break;
                case 27710: plantId = 2; //Black Twinberry
                break;
                case 24480: plantId = 3; // Red-oiser Dogwood
                break;
                case 28062: plantId = 4; //Thimbleberry
                break;
                case 28067: plantId = 5; //Sitka Spruce
                break;
                case 28071: plantId = 6; //Slough Sedge
                break;
                case 28070: plantId = 7; //Clustered Rose
                break;
                case 28703: plantId = 8; //Western Redcedar
                break;
                case 27711: plantId = 9; //Red Flowering Currant
                break;
                case 28088: plantId = 10; //Small-fruited Bulrush
                break;
                case 28094: plantId = 11; //Low Oregon Grape
                break;
                case 28064: plantId = 12; //Tall Oregon Grape
                break;
                case 28063: plantId = 13; //Pacific Ninebark
                break;
                case 28075: plantId = 14; //Cascara
                break;
                case 28061: plantId = 15; //Mock Orange
                break;
                case 28097: plantId = 16; //Pacific Willow
                break;
                case 28086: plantId = 17; //Black Cottonwood
                break;
                case 28066: plantId = 18; //Paper Birch
                break;
                case 28217: plantId = 19; //Grand Fir
                break;
                case 28704: plantId = 20; //Red Alder
                break;
                case 28098: plantId = 21; //Red Elderberry
                break;
                default:
                    plantId = -1
                    streamId = -1
                }
                
                plant = pm.getPlantByID(id: plantId)
                
                //plant = pm.getPlantByName(name: metadataObj.stringValue!)
                
                //check that the plant was found, if it wasnt then plant.id = -1
                if(plant.plantID != -1){
                    //Plant was found
                    //Call segue to plant list
                    self.performSegue(withIdentifier: "plantInfoSegue", sender: self)
                    /*guard let vc = UIStoryboard(name: "PlantInfo", bundle: nil).instantiateViewController(withIdentifier: "PlantInfoStoryboard") as?
                        PlantInfoViewController else{
                            print("Could not instantiate view controller with indentifier of type PlantInfoStoryboard")*/
                    return
                }
                    
                else if(streamId != -1){
                    self.performSegue(withIdentifier: "streamFormSegue", sender: self)
                }
                    
                    //vc.myPlant = plant;
                   // self.navigationController?.pushViewController(vc, animated: true)
                    /*
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "plantInfoSegue", sender: self.plant)
                 }*/
                }
                else{
                    let alertController = UIAlertController(title: "Scan Error", message:
                        "Failed to retrieve plant info from QR Code value", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "plantInfoSegue"){
            let vc = segue.destination as! PlantInfoViewController
            vc.myPlant = plant
        }
        
        if(segue.identifier == "streamFormSegue"){
            let vc = segue.destination as! StreamFormViewController
            vc.myStream = streamId
        }
    }
}
