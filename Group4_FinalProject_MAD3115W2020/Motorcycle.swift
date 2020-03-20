//
//  Motorcycle.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class Motorcycle: Vehicle{
    var maxTopSpeed: String
    var milage: String
    
    init(vehicleIdentificationNumber: String, vehicleDescription: String, manufacturerName: String, isSelfDrive: String, driverName: String, isInsured: String, noOfSeat: String, fuelType: String, ownerId: String, maxTopSpeed: String, milage: String) {
        self.maxTopSpeed = maxTopSpeed
        self.milage = milage
        super.init(vehicleIdentificationNumber: vehicleIdentificationNumber, vehicleDescription: vehicleDescription, manufacturerName: manufacturerName, isSelfDrive: isSelfDrive, driverName: driverName, isInsured: isInsured, noOfSeat: noOfSeat, fuelType: fuelType, ownerId: ownerId)
    }
}
