//
//  VehicleRentViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-24.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class VehicleRentViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var iId: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    @IBOutlet weak var iVIN: UILabel!
    @IBOutlet weak var iVehicle: UILabel!
    @IBOutlet weak var iBaseRate: UILabel!
    @IBOutlet weak var iRatePerKm: UILabel!
    @IBOutlet weak var iStartDate: UITextField!
    @IBOutlet weak var iEndDate: UITextField!
    @IBOutlet weak var iNoOfDays: UILabel!
    var datePicker: UIDatePicker!
    var rentStartDate: Date = Date()
     var rentEndDate: Date = Date()
     var noOfDays: Int = 0
    static var id = String()
    static var firstName = String()
    static var vin = String()
    static var vehicleName = String()
    static var baseRate = Double()
    static var ratePerKm = Double()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       intials()
    }
    
    func intials(){
        iId.text = "Id: " + VehicleRentViewController.id
        iFirstName.text = "Name: " + VehicleRentViewController.firstName
        iVIN.text = "VIN: " + VehicleRentViewController.vin
        iVehicle.text = "Vehicle: " + VehicleRentViewController.vehicleName
        iBaseRate.text = "Base rate: $ " + String(VehicleRentViewController.baseRate)
        iRatePerKm.text = "Rate per Km: $ " + String(VehicleRentViewController.ratePerKm)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.iStartDate)
        self.pickUpDate(self.iEndDate)
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

extension VehicleRentViewController
{
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
          let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(VehicleRentViewController.doneClick))
          let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
          let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(VehicleRentViewController.cancelClick))
          toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
          toolBar.isUserInteractionEnabled = true
          textField.inputAccessoryView = toolBar
          
      }
      
      @objc func doneClick() {
          let dateFormatter1 = DateFormatter()
            let dateFormatter2 = DateFormatter()
          dateFormatter1.dateStyle = .medium
          dateFormatter1.timeStyle = .none
        dateFormatter2.dateStyle = .medium
        dateFormatter2.timeStyle = .none
        if iStartDate.isEditing{
        iStartDate.text = dateFormatter1.string(from: datePicker.date)
        iStartDate.resignFirstResponder()
            self.rentStartDate = datePicker.date
            
        }
        else if iEndDate.isEditing{
        iEndDate.text = dateFormatter2.string(from: datePicker.date)
        iEndDate.resignFirstResponder()
            self.rentEndDate = datePicker.date
            self.noOfDays = self.noOfDays.daysBetween(start: self.rentStartDate, end: self.rentEndDate)
            if self.noOfDays >= 0{
                iNoOfDays.text = "No of Days: " + String(self.noOfDays)
                
            }else{
                iNoOfDays.text = "No of Days: Invalid Days"
            }
        }
      }
      
      @objc func cancelClick() {
         iStartDate.resignFirstResponder()
        iEndDate.resignFirstResponder()
         
 }
    
}
