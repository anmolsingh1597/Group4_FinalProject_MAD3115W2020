//
//  Person.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
class Person{
    var id : String
     var firstName : String
     var lastName : String
    var gender : Enum.Gender
     var birthDate: String
     var mobileNumber : String
     var emailId : String
     var userName : String
     var password : String
    
    init(id: String, firstName : String, lastName : String, gender : Enum.Gender, birthDate: String, mobileNumber : String, emailId : String, userName : String, password : String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.birthDate = birthDate
        self.mobileNumber = mobileNumber
        self.emailId = emailId
        self.userName = userName
        self.password = password
    }
 
}
