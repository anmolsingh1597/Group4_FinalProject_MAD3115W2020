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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func iButton(_ sender: UIButton) {
        iView1.isHidden = false
    }
}

