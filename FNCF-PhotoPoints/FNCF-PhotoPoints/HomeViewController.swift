//
//  ViewController.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/23/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //var userInfoCollected = false
    
 
    
    let pm = PlantManager()
    let testPlant = Plant(plantID: 42, name: "Test", latinName: "tEsT", desc: "This is the desction test, This is the desction test., This is the desction test., This is the desction test., This is the desction test., This is the desction test.This is the desction testThis is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test.This is the desction test..")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print(pm.getPlantByName(name: "Douglas Fir").name)
        print(pm.getPlantByID(id: 2).latinName)
        print(pm.getPlantByID(id: 4).desc)
        print(pm.getPlantByID(id: 5).desc)
        
        
    }
    
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }

}


