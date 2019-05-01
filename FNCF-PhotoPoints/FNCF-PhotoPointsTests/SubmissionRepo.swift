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
    
    let testPhoto = PhotoSubmission(PhotoName: "Stream 1", Comments: "things", id: 20)
    let testAgainst = PhotoSubmission (PhotoName: "Stream 1", Comments: "Things", id: 20)
    
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

    
    func test_showPhotoPoint() {
        
        PhotoTester.add(newPhoto: testPhoto)
        
        XCTAssertEqual(PhotoTester.get(identifier: 0)?.PhotoName, testAgainst.PhotoName)
        
    
        
        
    }
}
