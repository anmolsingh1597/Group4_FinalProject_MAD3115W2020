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
    private lazy var vehicleList: [Vehicle] = []
    private lazy var motorcycleList: [Motorcycle] = []
    private lazy var carList: [Car] = []
    private lazy var busList: [Bus] = []
    private lazy var vehicleRentList: [VehicleRent] = []
    private init (){}
    
    static func getInstance() -> DataStorage{
        return instance
    }
    
    // Persons
    
    func addCustomer(customer: Customer){
        self.customerList.append(customer)
    }
    func addDriver(driver: Driver){
        self.driverList.append(driver)
    }
    func addOwner(owner: Owner){
        self.ownerList.append(owner)
    }
    
    // Vehicles
    
    func addVehicle(vehicle: Vehicle){
        self.vehicleList.append(vehicle)
    }
    func addMotorcycle(motorcycle: Motorcycle){
        self.motorcycleList.append(motorcycle)
    }
    func addCar(car: Car){
        self.carList.append(car)
    }
    func addBus(bus: Bus){
        self.busList.append(bus)
    }
    
    // Vehicle Rent
    func addVehicleRent(vehicleRent: VehicleRent){
        self.vehicleRentList.append(vehicleRent)
    }
    
    // Fetch all Persons
    
    func getAllCustomers() -> [Customer]{
        return self.customerList
    }
    func getAllDrivers() -> [Driver]{
        return self.driverList
    }
    func getAllOwners() -> [Owner]{
        return self.ownerList
    }
    
    // Fetch all Vehicles
    
    func getAllVehicles() -> [Vehicle]{
        return self.vehicleList
    }
    func getAllMotorcycles() -> [Motorcycle]{
        return self.motorcycleList
    }
    func getAllCars() -> [Car]{
        return self.carList
    }
    func getAllBuses() -> [Bus]{
        return self.busList
    }
    // fetching all vehicle rents
    func getAllVehiclesRentList() -> [VehicleRent]{
        return self.vehicleRentList
    }
    
    // Getting data from Firebase
    
    func loadData() {
        let personRefer = self.ref.child("Persons")
        personRefer.observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let personDict = snapshot.value as? [String: [String: String]]{
                for value in personDict.values{
                    if value["personType"] == "Customer"{
                        self.customerList.append((Customer(id: value["id"] ?? "", firstName: value["firstName"] ?? "", lastName: value["lastName"] ?? "", gender: value["gender"] ?? "", birthDate: value["birthDate"] ?? "", mobileNumber: value["mobileNumber"] ?? "", emailId: value["email"] ?? "", userName: value["userName"] ?? "", password: value["password"] ?? "", address: value["address"] ?? "", city: value["city"] ?? "")))
                    
                    } else if value["personType"] == "Driver"{
                        self.driverList.append((Driver(id: value["id"] ?? "", firstName: value["firstName"] ?? "", lastName: value["lastName"] ?? "", gender: value["gender"] ?? "", birthDate: value["birthDate"] ?? "", mobileNumber: value["mobileNumber"] ?? "", emailId: value["email"] ?? "", userName: value["userName"] ?? "", password: value["password"] ?? "", drivingLicenceNumber: value["drivingLicenseNumber"] ?? "", isDrivingHistoryCleared: value["drivingHistory"] ?? "", salary: value["salary"] ?? "" )))
                        
                    }else if value["personType"] == "Owner"{
                        self.ownerList.append((Owner(id: value["id"] ?? "", firstName: value["firstName"] ?? "", lastName: value["lastName"] ?? "", gender: value["gender"] ?? "", birthDate: value["birthDate"] ?? "", mobileNumber: value["mobileNumber"] ?? "", emailId: value["email"] ?? "", userName: value["userName"] ?? "", password: value["password"] ?? "", companyTitle: value["companyTitle"] ?? "", businessNumber: value["businessNumber"] ?? "", website: value["website"] ?? "")))
                      
                    }else {}
                }
            }
        })
        let vehicleRefer = self.ref.child("Vehicles")
        vehicleRefer.observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let vehicleDict = snapshot.value as? [String: [String: String]]{
                for value in vehicleDict.values{
                    self.vehicleList.append((Vehicle(vehicleIdentificationNumber: value["vin"] ?? "", vehicleDescription: value["vehicleDescription"] ?? "", manufacturerName: value["manufacturerName"] ?? "", isSelfDrive: value["selfDrive"] ?? "", driverName: value["driverName"] ?? "", isInsured: value["isInsured"] ?? "", noOfSeat: value["noOfSeats"] ?? "", fuelType: value["fuelType"] ?? "", ownerId: value["ownerId"] ?? "", vehicleType: value["vehicleType"] ?? "")))
                    if value["vehicleType"] == "Motorcycle"{
                        self.motorcycleList.append((Motorcycle(vehicleIdentificationNumber: value["vin"] ?? "", vehicleDescription: value["vehicleDescription"] ?? "", manufacturerName: value["manufacturerName"] ?? "", isSelfDrive: value["selfDrive"] ?? "", driverName: value["driverName"] ?? "", isInsured: value["isInsured"] ?? "", noOfSeat: value["noOfSeats"] ?? "", fuelType: value["fuelType"] ?? "", ownerId: value["ownerId"] ?? "", vehicleType: value["vehicleType"] ?? "", maxTopSpeed: value["maxTopSpeed"] ?? "", milage: value["milage"] ?? "")))
                    }else if value["vehicleType"] == "Car"{
                        self.carList.append((Car(vehicleIdentificationNumber: value["vin"] ?? "", vehicleDescription: value["vehicleDescription"] ?? "", manufacturerName: value["manufacturerName"] ?? "", isSelfDrive: value["selfDrive"] ?? "", driverName: value["driverName"] ?? "", isInsured: value["isInsured"] ?? "", noOfSeat: value["noOfSeats"] ?? "", fuelType: value["fuelType"] ?? "", ownerId: value["ownerId"] ?? "", vehicleType: value["vehicleType"] ?? "", carType: value["carType"] ?? "", carColor: value["carColor"] ?? "")))
                    }else if value["vehicleType"] == "Bus"{
                        self.busList.append((Bus(vehicleIdentificationNumber: value["vin"] ?? "", vehicleDescription: value["vehicleDescription"] ?? "", manufacturerName: value["manufacturerName"] ?? "", isSelfDrive: value["selfDrive"] ?? "", driverName: value["driverName"] ?? "", isInsured: value["isInsured"] ?? "", noOfSeat: value["noOfSeats"] ?? "", fuelType: value["fuelType"] ?? "", ownerId: value["ownerId"] ?? "", vehicleType: value["vehicleType"] ?? "", typeOfBus: value["typeOfBus"] ?? "", isAccessibilityServiceavailable: value["isAccessibilityAvailable"] ?? "", isWifiAvailable: value["isWifiAvailable"] ?? "")))
                    }
                    else {
                        
                    }
                }
            }
        })
        let vehicleRentRefer = self.ref.child("VehicleRent")
        vehicleRentRefer.observeSingleEvent(of: .value, with: {(snapshot)
            in
            if let vehicleRentDict = snapshot.value as? [String: [String: String]]{
                for value in vehicleRentDict.values{
                    self.vehicleRentList.append((VehicleRent(custId: value["id"] ?? "", name: value["firstName"] ?? "", vin: value["vin"] ?? "", vehicle: value["vehicle"] ?? "", noOfDays: value["rentedNoOfDays"] ?? "", noOfKmDrived: value["noOfKmDrived"] ?? "", totalFare: value["totalFare"] ?? "")))
                }
            }
        })
    }
}
