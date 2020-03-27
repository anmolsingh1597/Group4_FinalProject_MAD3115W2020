//
//  VehicleRent.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-26.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class VehicleRent{
    var custId: String
    var name: String
    var vin: String
    var vehicle: String
    var noOfDays: String
    var noOfKmDrived: String
    var totalFare: String
    
    init(custId: String, name: String, vin: String, vehicle: String, noOfDays: String, noOfKmDrived: String, totalFare: String){
        self.custId = custId
        self.name = name
        self.vin = vin
        self.vehicle = vehicle
        self.noOfDays = noOfDays
        self.noOfKmDrived = noOfKmDrived
        self.totalFare = totalFare
    }
}
