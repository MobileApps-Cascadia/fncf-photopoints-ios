//
//  SubmissionMockTest.swift
//  FNCF-PhotoPointsTests
//
//  Created by Student Account on 4/29/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import XCTest
@testable import FNCF_PhotoPoints

class SubmissionMockTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    /*let PhotoName: String
    let Comments: String
    let id : Int
    */
    func testInit_PhotoInfo() {
        let testPhoto = PhotoSubmission(PhotoName: "Stream 1" , Comments: "Lots of wind", id: 20)
        
   
        XCTAssertNotNil(testPhoto)
        XCTAssertEqual(testPhoto.PhotoName, "Stream 1")
        XCTAssertEqual(testPhoto.Comments, "Lots of wind")
        XCTAssertNotNil(testPhoto.id)
    }

}
