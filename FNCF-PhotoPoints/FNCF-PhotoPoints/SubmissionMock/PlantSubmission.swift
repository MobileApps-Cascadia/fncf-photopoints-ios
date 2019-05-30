//
//  PlantSubmission.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 5/10/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

struct PlantSubmission {
    let Date: String
    let Fruit: String
    let Foliage : String
    let AdditionalComments: String
    var Images: [NSObject] = []
    
    
    
    init(Date: String, Fruit: String , Foliage: String, AdditionalComments: String/*, images: [NSObject]*/) {
        self.Date = Date;
        self.Fruit = Fruit
        self.Foliage = Foliage
        self.AdditionalComments = AdditionalComments
       // Images.append(images as NSObject);
        
    }
    
}
