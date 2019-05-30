//
//  SubmissionRepo.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

protocol PhotoRepository {
    var count:Int{get}
    
    func add(newPhoto: StreamSubmission)
    func add(newPhoto: PlantSubmission)
   
    func get (indentifier:Int) -> PlantSubmission?
    func get( identifier:Int ) -> StreamSubmission?
}


public class PhotoDataRepository:PhotoRepository{
    
    
    func add(newPhoto: PlantSubmission) {
        PlantInfo.append(newPhoto)
    }
    
    func get(indentifier: Int) -> PlantSubmission? {
        return PlantInfo[indentifier]
    }
    
    var count: Int {
        get{
            return PlantInfo.count
        }
    }

    
    func get(identifier: Int) -> StreamSubmission? {
        return Photoinfo[identifier]
    }
    
    var counter: Int {
        get
        {
            return Photoinfo.count
        }
        
        
    }
    
    func add(newPhoto: StreamSubmission) {
        
        Photoinfo.append(newPhoto)
    }
    
    private var PlantInfo = [PlantSubmission]()
    private var Photoinfo = [StreamSubmission]()
 
    
}

