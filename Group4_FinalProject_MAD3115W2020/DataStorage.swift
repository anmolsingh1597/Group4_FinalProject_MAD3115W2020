//
//  DataStorage.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-18.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import Foundation
import Firebase

class DataStorage{
    var ref = Database.database().reference()
    private static let instance = DataStorage()
    private lazy var customerList: [Customer] = []
    private lazy var driverList: [Driver] = []
    private lazy var ownerList: [Owner] = []
    private init (){}
    
    static func getInstance() -> DataStorage{
        return instance
    }
    func addCustomer(customer: Customer){
        self.customerList.append(customer)
    }
    func addDriver(driver: Driver){
        self.driverList.append(driver)
    }
    func addOwner(owner: Owner){
        self.ownerList.append(owner)
    }
    func getAllCustomers() -> [Customer]{
        return self.customerList
    }
    func getAllDrivers() -> [Driver]{
        return self.driverList
    }
    func getAllOwners() -> [Owner]{
        return self.ownerList
    }
}
