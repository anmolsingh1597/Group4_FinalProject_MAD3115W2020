//
//  AddPersonViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class AddPersonViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var iGeneralTextField1: UITextField!
    @IBOutlet weak var iGeneralTextField2: UITextField!
    @IBOutlet weak var iGeneralTextField3: UITextField!
    @IBOutlet weak var iId: UITextField!
    @IBOutlet weak var iFirstName: UITextField!
    @IBOutlet weak var iLastName: UITextField!
    @IBOutlet weak var iGender: UITextField!
    @IBOutlet weak var iBirthDate: UITextField!
    @IBOutlet weak var iMobileNumber: UITextField!
    @IBOutlet weak var iEmailId: UITextField!
    @IBOutlet weak var iUserName: UITextField!
    @IBOutlet weak var iPassword: UITextField!
    var ref = Database.database().reference()
    @IBOutlet weak var iPersonSegmentValue: UISegmentedControl!
    var insert: [String: String] = [String: String]()
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
             self.pickUpDate(self.iBirthDate)
         }
    
    @IBAction func iPersonSegment(_ sender: UISegmentedControl) {
        personSegmentValues(index: sender.selectedSegmentIndex)
    }
    
    private func personSegmentValues (index: Int){
        switch index {
        case 0:
            iGeneralTextField1.placeholder = "Address"
            iGeneralTextField2.placeholder = "City"
            iGeneralTextField3.isHidden = true
        case 1:
            iGeneralTextField1.placeholder = "License Number"
            iGeneralTextField2.placeholder = "Driving History"
            iGeneralTextField3.isHidden = false
            iGeneralTextField3.placeholder = "Salary"
        case 2:
            iGeneralTextField1.placeholder = "Company Title"
            iGeneralTextField2.placeholder = "Business Number"
            iGeneralTextField3.isHidden = false
            iGeneralTextField3.placeholder = "Website"
        default:
            iGeneralTextField1.isHidden = true
            iGeneralTextField2.isHidden = true
            iGeneralTextField3.isHidden = false
        }
    }
    
    @IBAction func iSavePersonDetails(_ sender: UIBarButtonItem) {
        let id = self.iId.text
        let firstName = self.iFirstName.text
        let lastName = self.iLastName.text
        let gender = self.iGender.text
        let birthDate = self.iBirthDate.text
        let mobileNumber = self.iMobileNumber.text
        let email = self.iEmailId.text
        let userName = iUserName.text
        let password = iPassword.text
        
         guard let key = self.ref.child("Persons").childByAutoId().key else {return}
        if iPersonSegmentValue.selectedSegmentIndex == 0{
            let address = iGeneralTextField1.text
            let city = iGeneralTextField2.text
            self.insert = ["id": ("CUS_" + (id ?? "")), "firstName": firstName ?? "", "lastName": lastName ?? "", "gender": gender ?? "", "birthDate": birthDate ?? "", "mobileNumber": mobileNumber ?? "", "email": email ?? "", "userName": userName ?? "","password": password ?? "", "address": address ?? "" , "city": city ?? "" , "personType": "Customer"]
            
            DataStorage.getInstance().addCustomer(customer: Customer.init(id: ("CUS_" + (id ?? "")), firstName: firstName ?? "", lastName: lastName ?? "", gender: gender ?? "", birthDate: birthDate ?? "", mobileNumber: mobileNumber ?? "", emailId: email ?? "", userName: userName ?? "", password: password ?? "", address: address ?? "", city: city ?? ""))
        }
        else if iPersonSegmentValue.selectedSegmentIndex == 1{
            let drivingLicenseNumber = iGeneralTextField1.text
            let drivingHistory = iGeneralTextField2.text
            let salary = iGeneralTextField3.text
            self.insert = ["id": ("DRI_" + (id ?? "")), "firstName": firstName ?? "", "lastName": lastName ?? "", "gender": gender ?? "", "birthDate": birthDate ?? "", "mobileNumber": mobileNumber ?? "", "email": email ?? "", "userName": userName ?? "","password": password ?? "","drivingLicenseNumber": drivingLicenseNumber ?? "" , "drivingHistory": drivingHistory ?? "" ,"salary": salary ?? "" , "personType": "Driver"]
            
            DataStorage.getInstance().addDriver(driver: Driver.init(id: ("DRI_" + (id ?? "")), firstName: firstName ?? "", lastName: lastName ?? "", gender: gender ?? "", birthDate: birthDate ?? "", mobileNumber: mobileNumber ?? "", emailId: email ?? "", userName: userName ?? "", password: password ?? "", drivingLicenceNumber: drivingLicenseNumber ?? "", isDrivingHistoryCleared: drivingHistory ?? "", salary: salary ?? ""))
        }
        else if iPersonSegmentValue.selectedSegmentIndex == 2{
            let companyTitle = iGeneralTextField1.text
            let businessNumber = iGeneralTextField2.text
            let website = iGeneralTextField3.text
            self.insert = ["id": ("OWN_" + (id ?? "")), "firstName": firstName ?? "", "lastName": lastName ?? "", "gender": gender ?? "", "birthDate": birthDate ?? "", "mobileNumber": mobileNumber ?? "", "email": email ?? "", "userName": userName ?? "","password": password ?? "","companyTitle": companyTitle ?? "" , "businessNumber": businessNumber ?? "" , "website": website ?? "" , "personType": "Owner"]
            
            DataStorage.getInstance().addOwner(owner: Owner.init(id: ("OWN_" + (id ?? "")), firstName: firstName ?? "", lastName: lastName ?? "", gender: gender ?? "", birthDate: birthDate ?? "", mobileNumber: mobileNumber ?? "", emailId: email ?? "", userName: userName ?? "", password: password ?? "", companyTitle: companyTitle ?? "", businessNumber: businessNumber ?? "", website: website ?? ""))
        }
        else {
            
        }
        
        if id == "" || firstName == ""
                       {
                          
                           let alertControll = UIAlertController(title: "Error!", message: "All fields are required", preferredStyle: .alert)
                                      alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                                      self.present(alertControll, animated: true, completion: nil)
                       }
        else{
            let childUpdates = ["/Persons/\(key)": insert]
            self.ref.updateChildValues(childUpdates)
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let listsVC = sb.instantiateViewController(identifier: "listsVC") as! ViewController
            self.navigationController?.pushViewController(listsVC, animated: true)
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

extension AddPersonViewController{
    func pickUpDate(_ textField : UITextField){
             
             // DatePicker
             self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
             self.datePicker.backgroundColor = UIColor.white
             self.datePicker.datePickerMode = UIDatePicker.Mode.date
             textField.inputView = self.datePicker
             
             // ToolBar
             let toolBar = UIToolbar()
             toolBar.barStyle = .default
             toolBar.isTranslucent = true
             toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
             toolBar.sizeToFit()
             
             // Adding Button ToolBar
             let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddPersonViewController.doneClick))
             let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
             let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddPersonViewController.cancelClick))
             toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
             toolBar.isUserInteractionEnabled = true
             textField.inputAccessoryView = toolBar
             
         }
         
         @objc func doneClick() {
             let dateFormatter1 = DateFormatter()
             dateFormatter1.dateStyle = .medium
             dateFormatter1.timeStyle = .none
             iBirthDate.text = dateFormatter1.string(from: datePicker.date)
             iBirthDate.resignFirstResponder()
         }
         
         @objc func cancelClick() {
            iBirthDate.resignFirstResponder()
            
    }
}
