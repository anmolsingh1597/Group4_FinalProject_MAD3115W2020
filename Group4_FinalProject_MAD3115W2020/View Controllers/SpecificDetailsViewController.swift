//
//  SpecificDetailsViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-27.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class SpecificDetailsViewController: UIViewController {
    static var segmentValue: Int = Int()
    static var personId: String = String()
    var customerList: [Customer] = []
    var driverList: [Driver] = []
    var ownerList: [Owner] = []
    @IBOutlet weak var iId: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    @IBOutlet weak var iLastName: UILabel!
    @IBOutlet weak var iGender: UILabel!
    @IBOutlet weak var iBirthDate: UILabel!
    @IBOutlet weak var iMibile: UILabel!
    @IBOutlet weak var iEmail: UILabel!
    @IBOutlet weak var iUsername: UILabel!
    @IBOutlet weak var iPassword: UILabel!
    @IBOutlet weak var iGeneralLabel1: UILabel!
    @IBOutlet weak var iGeneralLabel2: UILabel!
    @IBOutlet weak var iGeneralLabel3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     initials()
    }
    
    func initials(){
        if SpecificDetailsViewController.segmentValue == 0{
            customerList =  DataStorage.getInstance().getAllCustomers()
            customerList = customerList.filter({$0.id == SpecificDetailsViewController.personId})
            for value in customerList{
                iId.text = "ID: " + value.id
                iFirstName.text = "First Name: " + value.firstName
                iLastName.text = "Last Name: " + value.lastName
                iGender.text = "Gender: " + value.gender
                iBirthDate.text = "Birth Date: " + value.birthDate
                iMibile.text = "Mobile Number: " + value.mobileNumber
                iEmail.text = "Email: " + value.emailId
                iUsername.text = "User Name: " + value.userName
                iPassword.text = "Password: " + value.password
                iGeneralLabel1.text = "Address: " + value.address
                iGeneralLabel2.text = "City: " + value.city
            }
            iGeneralLabel3.isHidden = true
        }else if SpecificDetailsViewController.segmentValue == 1 {
            driverList = DataStorage.getInstance().getAllDrivers()
            driverList = driverList.filter({$0.id == SpecificDetailsViewController.personId})
                      for value in driverList{
                          iId.text = "ID: " + value.id
                          iFirstName.text = "First Name: " + value.firstName
                          iLastName.text = "Last Name: " + value.lastName
                          iGender.text = "Gender: " + value.gender
                          iBirthDate.text = "Birth Date: " + value.birthDate
                          iMibile.text = "Mobile Number: " + value.mobileNumber
                          iEmail.text = "Email: " + value.emailId
                          iUsername.text = "User Name: " + value.userName
                          iPassword.text = "Password: " + value.password
                        iGeneralLabel1.text = "Driving License Number: " + value.drivingLicenceNumber
                          iGeneralLabel2.text = "History: " + value.isDrivingHistoryCleared
                        iGeneralLabel3.text = "Salary: $" + value.salary
                      }
        }else if SpecificDetailsViewController.segmentValue == 2{
            ownerList = DataStorage.getInstance().getAllOwners()
            ownerList = ownerList.filter({$0.id == SpecificDetailsViewController.personId})
                      for value in ownerList{
                          iId.text = "ID: " + value.id
                          iFirstName.text = "First Name: " + value.firstName
                          iLastName.text = "Last Name: " + value.lastName
                          iGender.text = "Gender: " + value.gender
                          iBirthDate.text = "Birth Date: " + value.birthDate
                          iMibile.text = "Mobile Number: " + value.mobileNumber
                          iEmail.text = "Email: " + value.emailId
                          iUsername.text = "User Name: " + value.userName
                          iPassword.text = "Password: " + value.password
                        iGeneralLabel1.text = "Company Titla: " + value.companyTitle
                        iGeneralLabel2.text = "Business Number: " + value.businessNumber
                        iGeneralLabel3.text = "Website: " + value.website
                      }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
