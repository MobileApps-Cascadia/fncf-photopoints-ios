//
//  PlantManagerTest.swift
//  FNCF-PhotoPointsTests
//
//  Created by Student Account on 5/7/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//

import XCTest
@testable import FNCF_PhotoPoints

class dbOpsTest: XCTestCase {
    
   
    var testable = DbOperations()
    
    
    let testUser1 = BuildingUser(FirstName: "robert", LastName: "ramirez", Email: "v-roram@microsoft.com", Password: "robeary", Username: "Robear92")
    
    let testUser2 = BuildingUser(FirstName: "robert2", LastName: "ramirez2", Email: "v-roramies@microsoft.com", Password: "roobeary", Username: "Robearar")
    
    
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
    
    func test_addUser(){
        
  testable.add(firstName: testUser1.firstName, lastName: testUser1.lastName, email: testUser1.email, password: testUser1.password/*, userName: testUser1.username*/)
        
       
        XCTAssertEqual(testable.get(indentifier: testUser1.email), testUser1.email)
        
        //var MyPlant = PlantManager.getPlantByName(name: "Paper Birch");
        
    }
    
    
    func test_getUser() {
       
        let testing = testable.get(indentifier: testUser1.email)
    
        XCTAssertEqual(testing, testUser1.email)
    }
    
    func test_delete(){
        
        let duplicate = testUser2
        
        testable.add(firstName: testUser2.firstName, lastName: testUser2.lastName, email: testUser2.email, password: testUser2.password/*, userName: testUser2.username*/)
        
        testable.Delete(identifier: testUser2.email)
        
        XCTAssertNotEqual(testable.get(indentifier: testUser2.email), duplicate.email)
    }
    
    func test_modify(){
        
        testable.add(firstName: testUser2.firstName, lastName: testUser2.lastName, email: testUser2.email, password: testUser2.password /*userName: testUser2.username */)
        
     let val = testable.Modifyuser(Email: testUser2.email, Password: "changed")

        XCTAssertEqual(val, "changed")
        
        
    }
}
