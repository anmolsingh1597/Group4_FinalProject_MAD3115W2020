//
//  HomeViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-19.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import Firebase
import MessageUI

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
    @IBAction func iLogin(_ sender: UIButton) {
                        let user = self.iLoginId.text
                        let password = self.iPassword.text
                
     
                //-----------------------------------------

                        let refer = self.ref.child("Logins")
                        refer.observeSingleEvent(of: .value, with: { (snapshot) in
                        if let userDict = snapshot.value as? [String:[String:String]] {
                           // print(userDict.values)
                        let loginData = ["userName": user, "password": password]
                        if userDict.values.contains(loginData as! [String : String]){
                            //print("It worked")
                            let sb = UIStoryboard(name: "Main", bundle: nil)
                            let secondVC = sb.instantiateViewController(identifier: "listsVC") as! ViewController
                            self.navigationController?.pushViewController(secondVC, animated: true)
                        }
                        else{
                           let alertControll = UIAlertController(title: "Log In Failed", message: "Invalid User-name and Password ", preferredStyle: .alert)
                            alertControll.addAction(UIAlertAction(title: "Ok", style: .default))
                            self.present(alertControll, animated: true, completion: nil)
                            }
                }
                        }
                        )
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
    
    
    @IBAction func iContactUs(_ sender: UIButton) {
        
        if let url = URL(string: "tel://+9988421530)"), UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10, *)
            {
                UIApplication.shared.open(url)
            }
            else
            {
                UIApplication.shared.openURL(url)
            }
        }
    }
    

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
