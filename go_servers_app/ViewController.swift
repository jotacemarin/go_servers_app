//
//  ViewController.swift
//  go_servers_app
//
//  Created by Julio Marin on 5/25/19.
//  Copyright © 2019 Julio Marin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goServersLabel: UILabel!
    @IBOutlet weak var domainField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        domainField.delegate = self
    }

    @IBAction func findButton(_ sender: UIButton) {
        goServersLabel.text = domainField.text
        domainField.text = ""
    }
}

