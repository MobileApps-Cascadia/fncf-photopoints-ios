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
    
    func add(newPhoto: PhotoSubmission)
    
    func get( identifier:Int ) -> PhotoSubmission?
}


public class PhotoDataRepository:PhotoRepository{
    func get(identifier: Int) -> PhotoSubmission? {
        return Photoinfo[identifier]
    }
    
    var count: Int {
        get
        {
            return Photoinfo.count
        }
        
        
    }
    
    func add(newPhoto: PhotoSubmission) {
        
        Photoinfo.append(newPhoto)
    }
    
    private var Photoinfo = [PhotoSubmission]()
    
    
}

