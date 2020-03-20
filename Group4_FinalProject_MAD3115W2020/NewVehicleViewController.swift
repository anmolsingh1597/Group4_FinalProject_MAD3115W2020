//
//  NewVehicleViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class NewVehicleViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var iVIN: UITextField!
    @IBOutlet weak var iVehicleDescription: UITextField!
    @IBOutlet weak var iManufacturerName: UITextField!
    @IBOutlet weak var iSelfDrive: UITextField!
    @IBOutlet weak var iDriverName: UITextField!
    @IBOutlet weak var iIsInsured: UITextField!
    @IBOutlet weak var iNoOfSeats: UITextField!
    @IBOutlet weak var iFuelType: UITextField!
    @IBOutlet weak var iGeneralTextField1: UITextField!
    @IBOutlet weak var iGeneralTextField2: UITextField!
    @IBOutlet weak var iGeneralTextField3: UITextField!
    @IBOutlet weak var iVehicleSegmentValue: UISegmentedControl!
    var ref = Database.database().reference()
    var insert: [String: String] = [String: String]()
    var selfDrive = ["Yes","No"]
    let drivePicker = UIPickerView()
    var driverList: [Driver] = []
    var driverName: [String] = []
    let driverNamePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        intials()
    }
  
    func intials(){
        drivePicker.delegate = self
        drivePicker.dataSource = self
        driverNamePicker.delegate = self
        driverNamePicker.dataSource = self
        drivePicker.backgroundColor = UIColor.white
        driverNamePicker.backgroundColor = UIColor.white
        iSelfDrive.inputView = drivePicker
        iDriverName.inputView = driverNamePicker
        driverList = DataStorage.getInstance().getAllDrivers()
        for index in 0...driverList.count-1{
            driverName.append(driverList[index].firstName)
        }
    }
    @IBAction func iVehicleTypeSegment(_ sender: UISegmentedControl) {
        segmentValue(index: sender.selectedSegmentIndex)
    }
    
    private func segmentValue(index: Int){
        switch index {
        case 0:
            iGeneralTextField1.placeholder = "Max Top Speed"
            iGeneralTextField2.placeholder = "Mileage"
            iGeneralTextField3.isHidden = true
        case 1:
            iGeneralTextField1.placeholder = "Car Type"
            iGeneralTextField2.placeholder = "Car Color"
            iGeneralTextField3.isHidden = true
        case 2:
            iGeneralTextField1.placeholder = "Type of Bus"
            iGeneralTextField2.placeholder = "Accessibility Service"
            iGeneralTextField3.isHidden = false
            iGeneralTextField3.placeholder = "Wifi"
        default:
                iGeneralTextField1.isHidden = true
                iGeneralTextField2.isHidden = true
                iGeneralTextField3.isHidden = false
        }
    }
    @IBAction func iSaveVehicleValues(_ sender: UIBarButtonItem) {
        let vin = self.iVIN.text
        let vehicleDescription = self.iVehicleDescription.text
        let manufacturerName = self.iManufacturerName.text
        let selfDrive = self.iSelfDrive.text
        let driverName = self.iDriverName.text
        let isInsured = self.iIsInsured.text
        let noOfSeats = self.iNoOfSeats.text
        let fuelTyoe = self.iFuelType.text
         guard let key = self.ref.child("Vehicles").childByAutoId().key else {return}
        if iVehicleSegmentValue.selectedSegmentIndex == 0{
            let maxTopSpeed = iGeneralTextField1.text
            let milage = iGeneralTextField2.text
            self.insert = ["vin": vin ?? "", "vehicleDescription": vehicleDescription ?? "", "manufacturerName": manufacturerName ?? "", "selfDrive": selfDrive ?? "", "driverName": driverName ?? "", "isInsured": isInsured ?? "", "noOfSeats": noOfSeats ?? "", "fuelType": fuelTyoe ?? "", "maxTopSpeed": maxTopSpeed ?? "", "milage": milage ?? "", "vehicleType": "Motorcycle"]
        }else if iVehicleSegmentValue.selectedSegmentIndex == 1{
            let carType = iGeneralTextField1.text
            let carColor = iGeneralTextField2.text
            self.insert = ["vin": vin ?? "", "vehicleDescription": vehicleDescription ?? "", "manufacturerName": manufacturerName ?? "", "selfDrive": selfDrive ?? "", "driverName": driverName ?? "", "isInsured": isInsured ?? "", "noOfSeats": noOfSeats ?? "", "fuelType": fuelTyoe ?? "", "carType": carType ?? "", "carColor": carColor ?? "", "vehicleType": "Car"]
        }else if iVehicleSegmentValue.selectedSegmentIndex == 2{
            let typeOfBus = iGeneralTextField1.text
            let accessibility = iGeneralTextField2.text
            let wifi = iGeneralTextField3.text
            self.insert = ["vin": vin ?? "", "vehicleDescription": vehicleDescription ?? "", "manufacturerName": manufacturerName ?? "", "selfDrive": selfDrive ?? "", "driverName": driverName ?? "", "isInsured": isInsured ?? "", "noOfSeats": noOfSeats ?? "", "fuelType": fuelTyoe ?? "", "typeOfBus": typeOfBus ?? "", "isAccessibilityAvailable": accessibility ?? "", "isWifiAvailable": wifi ?? "", "vehicleType": "Bus"]
        }
        else{
            
        }
        if vin == ""||vehicleDescription == ""{
        let alertControll = UIAlertController(title: "Error!", message: "All fields are required", preferredStyle: .alert)
                                             alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                                             self.present(alertControll, animated: true, completion: nil)
        }else {
            let childUpdates = ["/Vehicles/\(key)": insert]
                       self.ref.updateChildValues(childUpdates)
                       
                       let sb = UIStoryboard(name: "Main", bundle: nil)
                       let listsVC = sb.instantiateViewController(identifier: "vehicleListVC") as! VehicleListViewController
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
extension NewVehicleViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == drivePicker{
            return self.selfDrive.count}
       else if pickerView == driverNamePicker{
            return self.driverName.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == drivePicker{
            return self.selfDrive[row]}
        else if pickerView == driverNamePicker{
                  return self.driverName[row]
              }
        return self.driverName[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
         if pickerView == drivePicker{
            iSelfDrive.text = selfDrive[row]
            if iSelfDrive.text == "Yes"{
                iDriverName.text = "None"
            }
         }else if pickerView == driverNamePicker{
            iDriverName.text = driverName[row]
            
        }
   
}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
