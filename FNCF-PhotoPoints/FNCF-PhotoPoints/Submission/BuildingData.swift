//
//  BuildingData.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 11/6/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation
import Photos

struct StreamOBJ {
 //   let Photo : UIImage
    let Date: Date
    let Weather : String
    let StreamHeight: Float
    let StreamID: Int
    
    
    init(//photo: UIImage,
         date: Date,
         weather : String,
         streamheight: Float,
         streamid: Int)
    {
       // Photo = photo
        Date = date
        Weather = weather
        StreamHeight = streamheight
        StreamID = streamid
    }
    
    
}

struct PlantOBJ {
  //  let Photo: String
    let Date: Date
    let Foliage : Bool
    let Fruit: Bool
    let PlantID: Int
    let Comments: String
    
    
    init(date: Date,
         foliage: Bool,
         fruit : Bool,
         plantid: Int,
         comments: String)
    {
        Date = date
        Foliage = foliage
        Fruit = fruit
        PlantID = plantid
        Comments = comments
    }
    
    
}
