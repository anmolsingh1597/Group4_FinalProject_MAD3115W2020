//
//  Customer.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

 class Customer: Person
{
    var address: String
      var city: String
    init(id: String, firstName : String, lastName : String, gender : String, birthDate: String, mobileNumber : String, emailId : String, userName : String, password : String, address: String, city: String) {
        self.address = address
        self.city = city
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, mobileNumber: mobileNumber, emailId: emailId, userName: userName, password: password)
    }
    
}
