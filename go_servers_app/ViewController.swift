//
//  ViewController.swift
//  go_servers_app
//
//  Created by Julio Marin on 5/25/19.
//  Copyright © 2019 Julio Marin. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goServersLabel: UILabel!
    @IBOutlet weak var domainField: UITextField!
    
    var apiBasePath: String = "http://localhost:4500/api/v1"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.domainField.delegate = self
    }

    @IBAction func findButton(_ sender: UIButton) {
        print(self.domainField.text!)
        Alamofire.request("\(apiBasePath)/analyze?host=\(self.domainField.text!)").responseJSON { response in
            if let json = response.result.value {
                print("JSON: \(json)")
                
            }
        }
    }
}

