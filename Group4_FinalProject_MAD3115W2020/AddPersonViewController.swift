//
//  AddPersonViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class AddPersonViewController: UIViewController {
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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
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
