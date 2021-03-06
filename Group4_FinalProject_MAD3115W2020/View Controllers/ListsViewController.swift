//
//  ViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
//import MaterialComponents.MaterialCards

class ListsViewController: UIViewController {
    @IBOutlet weak var iView1: UIView!
    @IBOutlet weak var iView2: UIView!
    @IBOutlet weak var iView3: UIView!
    @IBOutlet weak var iTableViewCustomer: UITableView!
    @IBOutlet weak var iTableDrivers: UITableView!
    @IBOutlet weak var iTableOwners: UITableView!
    var customerList: [Customer] = []
    var driverList: [Driver] = []
    var ownerList: [Owner] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customerList = DataStorage.getInstance().getAllCustomers()
        driverList = DataStorage.getInstance().getAllDrivers()
        ownerList = DataStorage.getInstance().getAllOwners()
    }
    
    @IBAction func iPersonSegment(_ sender: UISegmentedControl) {
        personSegmentValue(index: sender.selectedSegmentIndex)
    }
    
    private func personSegmentValue(index: Int){
        switch index {
        case 0:
            iView1.isHidden = false
            iView2.isHidden = true
            iView3.isHidden = true
            DetailsTableViewController.segmentValue = 0
        case 1:
            iView2.isHidden = false
            iView1.isHidden = true
            iView3.isHidden = true
            DetailsTableViewController.segmentValue = 1
        case 2:
            iView1.isHidden = true
            iView2.isHidden = true
            iView3.isHidden = false
            DetailsTableViewController.segmentValue = 2
        default:
            iView1.isHidden = true
            iView2.isHidden = true
            iView3.isHidden = true
        }
    }
    
    @IBAction func iHome(_ sender: UIButton) {
        let alertControll = UIAlertController(title: "Logout!", message: "Are you sure?", preferredStyle: .alert)
           alertControll.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: {(action) in
                self.navigationController?.popToRootViewController(animated: true)
           }))
           self.present(alertControll, animated: true, completion: nil)
   
    }
    
    
}

extension ListsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableview: UITableView) -> Int{
            return 1
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == iTableViewCustomer{
            return customerList.count
            
        }else if tableView == iTableDrivers{
            return driverList.count
        
        }else if tableView == iTableOwners{
            return ownerList.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == iTableViewCustomer{
            let customerCell = tableView.dequeueReusableCell(withIdentifier: "customerCell")
            let person = customerList[indexPath.row]
            customerCell?.textLabel?.text = person.firstName
            customerCell?.detailTextLabel?.text = person.lastName
            return customerCell!
        } else if tableView == iTableDrivers{
        let driverCell = tableView.dequeueReusableCell(withIdentifier: "driverCell")
            let person = driverList[indexPath.row]
            driverCell?.textLabel?.text = person.firstName
            driverCell?.detailTextLabel?.text = person.lastName
            return driverCell!}
        else if tableView == iTableOwners{
            let ownerCell = tableView.dequeueReusableCell(withIdentifier: "ownerCell")
            let person = ownerList[indexPath.row]
            ownerCell?.textLabel?.text = person.firstName
            ownerCell?.detailTextLabel?.text = person.lastName
                return ownerCell!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == iTableViewCustomer{
            let person = customerList[indexPath.row]
            VehicleRentViewController.id = person.id
            VehicleRentViewController.firstName = person.firstName + " " + person.lastName
        }
       else if tableView == iTableOwners{
            let person = ownerList[indexPath.row]
            VehicleListViewController.ownerId = person.id
            VehicleListViewController.firstName = person.firstName
            NewVehicleViewController.ownerId = person.id
        }
    }
    
    
}
