//
//  UserTest.swift
//  FNCF-PhotoPoints
//
//  Created by Student Account on 10/22/19.
//  Copyright © 2019 Cascadia-Mobile. All rights reserved.
//
import Foundation
// BluePrint
/*
 BluePrint:
 firstName : string
 lastName : string
 email : string
 password : string
 userName : string
 images : Binary data
 
 
 */
struct BuildingUser {
    let firstName: String
    let lastName: String
    let email : String
    let password: String
    let username: String
    
    
    init(FirstName: String,
         LastName: String,
         Email : String,
         Password: String,
         Username: String)
    {
        firstName = FirstName
        lastName = LastName
        email = Email
        password = Password
        username = Username
    }
    
    
}
