//
//  Bus.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

class Bus: Vehicle{
    var typeOfBus: String
    var isAccessibilityServiceavailable: String
    var isWifiAvailable: String
    init(vehicleIdentificationNumber: String, vehicleDescription: String, manufacturerName: String, isSelfDrive: String, driverName: String, isInsured: String, noOfSeat: String, fuelType: String, typeOfBus: String, isAccessibilityServiceavailable: String, isWifiAvailable:String){
        self.typeOfBus = typeOfBus
        self.isAccessibilityServiceavailable = isAccessibilityServiceavailable
        self.isWifiAvailable = isWifiAvailable
        super.init(vehicleIdentificationNumber: vehicleIdentificationNumber, vehicleDescription: vehicleDescription, manufacturerName: manufacturerName, isSelfDrive: isSelfDrive, driverName: driverName, isInsured: isInsured, noOfSeat: noOfSeat, fuelType: fuelType)
    }
}
