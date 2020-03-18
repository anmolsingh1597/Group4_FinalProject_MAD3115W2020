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
    @IBOutlet weak var iTableViewCustomer: UITableView!
    @IBOutlet weak var iTableDrivers: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func iPersonSegment(_ sender: UISegmentedControl) {
        personSegmentValue(index: sender.selectedSegmentIndex)
    }
    
    private func personSegmentValue(index: Int){
        switch index {
        case 0:
            iView1.isHidden = false
            iView2.isHidden = true
        case 1:
            iView2.isHidden = false
            iView1.isHidden = true
        default:
            iView1.isHidden = true
            iView2.isHidden = true
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        return UITableViewCell()
    }
    
    
}
