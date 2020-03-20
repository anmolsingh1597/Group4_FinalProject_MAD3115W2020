//
//  VehicleListViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit

class VehicleListViewController: UIViewController {

    @IBOutlet weak var iOwnerID: UILabel!
    @IBOutlet weak var iFirstName: UILabel!
    static var ownerId = String()
    static var firstName = String()
    var vehicleList: [Vehicle] = []
    var vehicleFilteredArray: [Vehicle] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        iOwnerID.text = VehicleListViewController.ownerId
        iFirstName.text = VehicleListViewController.firstName
        vehicleList = DataStorage.getInstance().getAllVehicles()
        
        // vehicleList array filtered according to Owner_id
        
        vehicleFilteredArray = vehicleList.filter{$0.ownerId == VehicleListViewController.ownerId}
    }
    @IBAction func iLists(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
              let listsVC = sb.instantiateViewController(identifier: "listsVC") as! ViewController
              self.navigationController?.pushViewController(listsVC, animated: true)
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

extension VehicleListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleFilteredArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "vehicleListCell")
        if vehicleFilteredArray.isEmpty == true{
            
        }else{
            let vehicle = vehicleFilteredArray[indexPath.row]
            cell?.textLabel?.text = vehicle.manufacturerName + " " + vehicle.vehicleDescription
            cell?.detailTextLabel?.text = vehicle.vehicleIdentificationNumber
            
        }
        
        return cell!
    }
    
    
}
