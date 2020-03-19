//
//  NewVehicleViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

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
