//
//  Vehicle.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class Vehicle{
    
    var vehicleIdentificationNumber: String
    var vehicleDescription: String
    var manufacturerName: String
    var isSelfDrive: String
    var driverName: String
    var isInsured: String
    var noOfSeat: String
    var fuelType: String
    var ownerId: String
    var vehicleType: String
//    var baseRate: Double = 0.0
//    var ratePerKm: Double = 0.0
    init(vehicleIdentificationNumber: String, vehicleDescription: String, manufacturerName: String, isSelfDrive: String, driverName: String, isInsured: String, noOfSeat: String, fuelType: String, ownerId: String, vehicleType: String) {
        self.vehicleIdentificationNumber = vehicleIdentificationNumber
        self.vehicleDescription = vehicleDescription
        self.manufacturerName = manufacturerName
        self.isSelfDrive = isSelfDrive
        self.driverName = driverName
        self.isInsured = isInsured
        self.noOfSeat = noOfSeat
        self.fuelType = fuelType
        self.ownerId = ownerId
        self.vehicleType = vehicleType
    }
}
