//
//  ViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-17.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
//import MaterialComponents.MaterialCards

class ViewController: UIViewController {
    @IBOutlet weak var iView1: UIView!
    @IBOutlet weak var iView2: UIView!
    @IBOutlet weak var iView3: UIView!
    @IBOutlet weak var iTableViewCustomer: UITableView!
    @IBOutlet weak var iTableDrivers: UITableView!
    @IBOutlet weak var iTableOwners: UITableView!
    var customerList:[Customer] = []
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
        case 1:
            iView2.isHidden = false
            iView1.isHidden = true
            iView3.isHidden = true
        case 2:
            iView1.isHidden = true
            iView2.isHidden = true
            iView3.isHidden = false
        default:
            iView1.isHidden = true
            iView2.isHidden = true
            iView3.isHidden = true
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
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
            customerCell?.textLabel?.text = "Customer: Anmol"
            return customerCell!
        } else if tableView == iTableDrivers{
        let driverCell = tableView.dequeueReusableCell(withIdentifier: "driverCell")
        driverCell?.textLabel?.text = "Anmol"
            return driverCell!}
        else if tableView == iTableOwners{
            let ownerCell = tableView.dequeueReusableCell(withIdentifier: "ownerCell")
            ownerCell?.textLabel?.text = "Anmol"
                return ownerCell!
        }
        return UITableViewCell()
    }
    
    
}
