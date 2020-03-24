//
//  VehicleRentViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-24.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class VehicleRentViewController: UIViewController {
    @IBOutlet weak var iId: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    @IBOutlet weak var iVIN: UILabel!
    @IBOutlet weak var iVehicle: UILabel!
    @IBOutlet weak var iBaseRate: UILabel!
    @IBOutlet weak var iRatePerKm: UILabel!
    static var id = String()
    static var firstName = String()
    static var vin = String()
    static var vehicleName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       intials()
    }
    
    func intials(){
    iId.text = VehicleRentViewController.id
    iFirstName.text = VehicleRentViewController.firstName
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
