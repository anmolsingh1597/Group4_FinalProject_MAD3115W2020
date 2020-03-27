//
//  VehicleRentTableViewCell.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-26.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class VehicleRentTableViewCell: UITableViewCell {

    @IBOutlet weak var iCustomerId: UILabel!
    
    @IBOutlet weak var iName: UILabel!
    @IBOutlet weak var iVIN: UILabel!
    @IBOutlet weak var iVehicle: UILabel!
    @IBOutlet weak var iNoOfDays: UILabel!
    @IBOutlet weak var iNoOfKm: UILabel!
    @IBOutlet weak var iTotalFare: UILabel!
}
