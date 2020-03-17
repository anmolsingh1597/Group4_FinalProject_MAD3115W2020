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

    @IBAction func iButton(_ sender: UIButton) {
        iView1.isHidden = false
        iView2.isHidden = true
 }
    
    @IBAction func iButton2(_ sender: UIButton) {
        iView2.isHidden = false
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "driverCell")
        cell?.textLabel?.text = "Anmol"
        return cell!
    }
    
    
}
