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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drivePicker.delegate = self
        drivePicker.dataSource = self
        iSelfDrive.inputView = drivePicker
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
        return self.selfDrive.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.selfDrive[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        iSelfDrive.text = selfDrive[row]
}

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
