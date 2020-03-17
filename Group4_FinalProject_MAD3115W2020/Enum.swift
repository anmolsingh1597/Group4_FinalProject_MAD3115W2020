//
//  Enum.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation

public struct Enum
{
    enum Gender: String {
        case Male
        case Female
        case Other
    }
    
    enum FuelType: String{
        case Petrol
        case Diesel
        case Electric
    }
    
    enum CarType: String{
        case SUV
        case Sedan
        case Luxury
    }
    
    enum BusType: String{
        case Mini
        case Volvo
        case DoubleDecker
    }
}
