//
//  Owner.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
class Owner: Person{
    var companyTitle: String
    var businessNumber: String
    var website: String
    init(id: String, firstName: String, lastName: String, gender: String, birthDate: String, mobileNumber: String, emailId: String, userName: String, password: String, companyTitle: String, businessNumber: String, website: String) {
        self.businessNumber = businessNumber
        self.companyTitle = companyTitle
        self.website = website
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, mobileNumber: mobileNumber, emailId: emailId, userName: userName, password: password)
    }
}
