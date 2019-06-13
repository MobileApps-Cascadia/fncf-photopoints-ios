//
//  SubmissionMock.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation

struct StreamSubmission {
    let Date: String
    let Weather: String
    let StreamHeight : String
    
    
    
    
    init(Date: String, Weather: String , StreamHeight: String) {
        self.Date = Date
        self.Weather = Weather
        self.StreamHeight = StreamHeight
    }
    
}
