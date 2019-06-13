//
//  File.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/23/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

class Plant: NSObject{
    var plantID: Int
    var name: String
    var latinName: String
    var desc: String
    
    init(plantID: Int, name: String, latinName: String, desc: String) {
        self.plantID = plantID
        self.name = name
        self.latinName = latinName
        self.desc = desc
    }

}
