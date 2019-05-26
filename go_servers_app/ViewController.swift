//
//  ViewController.swift
//  go_servers_app
//
//  Created by Julio Marin on 5/25/19.
//  Copyright © 2019 Julio Marin. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goServersLabel: UILabel!
    @IBOutlet weak var domainField: UITextField!
    @IBOutlet weak var domainInfoTxt: UITextView!
    @IBOutlet weak var domainLogoImg: UIImageView!
    
    var apiBasePath: String = "http://localhost:4500/api/v1"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.domainField.delegate = self
        self.domainInfoTxt.text.append("Title: \n")
        self.domainInfoTxt.text.append("Active: \n")
        self.domainInfoTxt.text.append("Ssl Grade: \n")
        self.domainInfoTxt.text.append("Previus Ssl Grade: \n")
        self.domainInfoTxt.text.append("Server Changed: \n")
    }

    @IBAction func findButton(_ sender: UIButton) {
        print(self.domainField.text!)
        Alamofire.request("\(apiBasePath)/analyze?host=\(self.domainField.text!)").responseString { response in
            if let json = response.result.value {
                // print("JSON: \(json)")
                let domain = Domain(json: json)
                self.domainInfoTxt.text = ""
                self.domainInfoTxt.text.append("Title: \t\t\t\t\(domain.title!)\n")
                if domain.isDown! {
                    self.domainInfoTxt.text.append("Active: \t\t\t\tNo\n")
                } else {
                    self.domainInfoTxt.text.append("Active: \t\t\t\tYes\n")
                }
                self.domainInfoTxt.text.append("Ssl Grade: \t\t\t\(domain.sslGrade!)\n")
                self.domainInfoTxt.text.append("Previus Ssl Grade: \t\(domain.previusSslGrade!)\n")
                if domain.serverChanged! {
                    self.domainInfoTxt.text.append("Server Changed: \tYes\n")
                } else {
                    self.domainInfoTxt.text.append("Server Changed: \t\tNo\n")
                }
                Alamofire.request(domain.logo!, method: .get).responseImage { imageResponse in
                    guard let image = imageResponse.result.value else {
                        return
                    }
                    self.domainLogoImg.image = image
                }
                self.domainField.text = ""
            }
        }
    }
}
