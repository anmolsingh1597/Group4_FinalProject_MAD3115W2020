//
//  HomeViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {
    @IBOutlet weak var iLoginId: UITextField!
    @IBOutlet weak var iPassword: UITextField!
    @IBOutlet weak var iRememberMe: UISwitch!
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
self.navigationItem.setHidesBackButton(true, animated: true);
        intials()
        
    }
    func intials(){
        iRememberMe.addTarget(self, action: #selector(self.stateChanged), for: .valueChanged)
                       let defaults: UserDefaults? = UserDefaults.standard

               // check if defaults already saved the details
                   if (defaults?.bool(forKey: "ISRemember"))! {
                       iLoginId.text = defaults?.value(forKey: "SavedUserName") as? String
                       iPassword.text = defaults?.value(forKey: "SavedPassword") as? String
                           iRememberMe.setOn(true, animated: false)
                       }
                       else {
                           iRememberMe.setOn(false, animated: false)
                       }
    }
    
        @objc func stateChanged(_ switchState: UISwitch) {

        let defaults: UserDefaults? = UserDefaults.standard
            if switchState.isOn {
            defaults?.set(true, forKey: "ISRemember")
            defaults?.set(iLoginId.text, forKey: "SavedUserName")
            defaults?.set(iPassword.text, forKey: "SavedPassword")
        }
        else {
            defaults?.set(false, forKey: "ISRemember")
            }
            }
    

    @IBAction func iLogin(_ sender: UIBarButtonItem) {
        
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
