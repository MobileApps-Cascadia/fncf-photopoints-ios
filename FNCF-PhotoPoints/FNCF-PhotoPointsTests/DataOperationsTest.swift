//
//  DataOperationsTest.swift
//  FNCF-PhotoPointsTests
//
//  Created by Student Account on 11/6/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import Foundation
//
//  PlantManagerTest.swift
//  FNCF-PhotoPointsTests
//
//  Created by Student Account on 5/7/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import XCTest
@testable import FNCF_PhotoPoints

class DataOperationsTest: XCTestCase {
    
    
   // var testable = DbOperations()
    
    var testing = DataOperations()
    
    let Streamtest1 = StreamOBJ(date: Date.distantPast, weather: "cloudy", streamheight: 0.5 , streamid: 1)
    let Streamtest2 = StreamOBJ(date: Date.distantPast, weather: "clear", streamheight: 0.53 , streamid: 2)
    
    
    let PlantTest1 = PlantOBJ(date: Date.distantFuture, foliage: true, fruit: false, plantid: 1, comments: "lots of foliage")
    let PlantTest2 = PlantOBJ(date: Date.distantFuture, foliage: false, fruit: true, plantid: 2, comments: "lots of berries")
    
    
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
    
    func test_addPlant(){
        
        
        
        testing.addPlant(newPlant: PlantTest1)
        
        XCTAssertEqual(testing.getPlant(indentifier: 1), PlantTest1.PlantID)
      
        
        //var MyPlant = PlantManager.getPlantByName(name: "Paper Birch");
        
    }
    
    func test_addStream(){
     
       testing.addStream(newStream: Streamtest1)
        
       XCTAssertEqual(testing.getStream(indentifier: 1), Streamtest1.StreamID)
        
    }

    func test_GetStream() {
        testing.addStream(newStream: Streamtest1)
        
        XCTAssertEqual(testing.getStream(indentifier: 1), Streamtest1.StreamID)
        
    }
    
    func test_GetPlant() {
        testing.addPlant(newPlant: PlantTest1)
        
        XCTAssertEqual(testing.getPlant(indentifier: 1), PlantTest1.PlantID)
        
    }
    
    func test_DeleteStream() {
        
        testing.addStream(newStream: Streamtest2)
        testing.DeleteStream(identifier: 2)

        XCTAssertEqual(testing.getStream(indentifier: 2), -1)
        
        
    }
    
    func test_DeletePlant() {
        
        testing.addPlant(newPlant: PlantTest2)
        testing.DeletePlant(identifier: 2)
     
        XCTAssertEqual(testing.getPlant(indentifier: 2), -1)
    
    }
    
    
    func test_modify(){
      /*
        testable.add(firstName: testUser2.firstName, lastName: testUser2.lastName, email: testUser2.email, password: testUser2.password, userName: testUser2.username)
        
        let val = testable.Modifyuser(Email: testUser2.email, Password: "changed")
        
        XCTAssertEqual(val, "changed")
        
        */
    }
}
