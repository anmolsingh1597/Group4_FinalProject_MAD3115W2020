//
//  WebViewController.swift
//  Group4_FinalProject_MAD3115W2020
//
//  Created by Anmol singh on 2020-03-26.
//  Copyright © 2020 Swift Project. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var iWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lambtonURL()
    }
    
    func lambtonURL(){
         let url = URL(string: "https://www.lambtoncollege.ca/Presidents_Welcome/")
         let urlRequest = URLRequest(url: url!)
         iWebView.load(urlRequest)
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
