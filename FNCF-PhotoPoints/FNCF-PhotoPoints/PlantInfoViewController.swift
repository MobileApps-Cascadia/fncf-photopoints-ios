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
    
    let plantList = ["Douglas Fir", "Redwood", "Cedar"]
    
    //var plant: Plant
    
    //var myManager = PlantManager()
    
    //func getPlantName(){
        //plant = myManager.getPlantByName(name: "Douglas Fir")
    //}
    
    func getName() -> String {
        
        //return PlantManager.getPlantByName(name: "Douglas Fir")
        return ""
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        var plantManager = PlantManager()
        //plantNameLabel.text = plantList[0]
        
        plantNameLabel.text = plantManager.getPlantByName(name: "Douglas Fir").latinName
    }
}
