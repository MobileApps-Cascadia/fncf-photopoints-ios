//
//  PlantInfoViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 5/2/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class PlantInfoViewController: UIViewController {
    
    @IBOutlet var plantNameLabel: UILabel!
    
    var plant: Plant
    
    var myManager = PlantManager()
    
    func getPlantName(){
        plant = myManager.getPlantByName(name: "Douglas Fir")
    }
    
    func getName() -> String {
        
        //return PlantManager.getPlantByName(name: "Douglas Fir")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        plantNameLabel.text = PlantManager.getPlantByName(name: "Douglas Fir")
        
    }
}
