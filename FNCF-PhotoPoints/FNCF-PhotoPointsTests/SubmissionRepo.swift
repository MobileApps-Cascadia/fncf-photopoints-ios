//
//  SubmissionRepo.swift
//  FNCF-PhotoPointsTests
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import XCTest
@testable import FNCF_PhotoPoints

class SubmissionRepo: XCTestCase {

    
    var PhotoTester: PhotoRepository!
    
    let testPhoto = StreamSubmission( Date: "Stream 1", Weather: "things", StreamHeight: "20")
    
    
    let testAgainst = StreamSubmission (Date: "Stream 1", Weather: "Things", StreamHeight: "20")
    
    override func setUp() {
        PhotoTester = PhotoDataRepository()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_AddPhoto() {
        
        PhotoTester.add(newPhoto: testPhoto)
        
        XCTAssertEqual(PhotoTester.get(identifier: 0)?.Date, testAgainst.Date)
            //this second assert is to determine if the value was saved into the repository.
        
    }
}
