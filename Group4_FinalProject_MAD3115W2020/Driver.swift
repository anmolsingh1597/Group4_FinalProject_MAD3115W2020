//
//  Driver.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class Driver: Person{
    var drivingLicenceNumber: String
    var isDrivingHistoryCleared: String
    var salary: String
    
    init(id: String, firstName: String, lastName: String, gender: Enum.Gender, birthDate: String, mobileNumber: String, emailId: String, userName: String, password: String, drivingLicenceNumber: String, isDrivingHistoryCleared:String, salary: String ) {
        self.drivingLicenceNumber = drivingLicenceNumber
        self.isDrivingHistoryCleared = isDrivingHistoryCleared
        self.salary = salary
        super.init(id: id, firstName: firstName, lastName: lastName, gender: gender, birthDate: birthDate, mobileNumber: mobileNumber, emailId: emailId, userName: userName, password: password)
    }
}
