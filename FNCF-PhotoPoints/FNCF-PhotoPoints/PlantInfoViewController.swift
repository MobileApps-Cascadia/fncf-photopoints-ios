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
    
    var myPlant: Plant!
    let plantManager = PlantManager()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if(myPlant == nil)
        {
            myPlant = Plant(plantID: -1, name: "failed to get plant", latinName: "failed to get plant", desc: "failed to get plant")
        }
        
        plantNameLabel.text = myPlant.name
        
        latinNameLabel.text = myPlant.latinName
        
        descriptionLabel.text = myPlant.desc
    }
}
