//
//  SubmissionMock.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

struct PhotoSubmission {
    let PhotoName: String
    let Comments: String?
    let id : Int?
    
    
    
    
    init(PhotoName: String, Comments: String? , id: Int?) {
        self.PhotoName = PhotoName
        self.Comments = Comments
        self.id = id
    }
    
}
