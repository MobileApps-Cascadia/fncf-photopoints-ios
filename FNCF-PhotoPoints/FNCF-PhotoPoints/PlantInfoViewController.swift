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
    @IBOutlet var latinNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let plantManager = PlantManager()
        
        plantNameLabel.text = plantManager.getPlantByName(name: "Douglas Fir").name
        
        latinNameLabel.text = plantManager.getPlantByName(name: "Douglas Fir").latinName
        
        descriptionLabel.text = plantManager.getPlantByName(name: "Douglas Fir").desc
    }
}
