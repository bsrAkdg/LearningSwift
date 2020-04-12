//
//  ViewController.swift
//  AlertProject
//
//  Created by Büşra Serdaroğlu on 11.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordAgain: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
        let username = textFieldUsername.text
        let password = textFieldPassword.text
        let passwordAgain = textFieldPasswordAgain.text
        
        if username == "" {
            showAlert(title: "Error", message: "Please enter username")

        } else if password == "" {
            showAlert(title: "Error", message: "Please enter password")
        } else if passwordAgain == "" {
            showAlert(title: "Error", message: "Please enter password again")
        } else if password != passwordAgain {
            showAlert(title: "Error", message: "Passwords not matched")
        } else {
            showAlert(title: "Success", message: "\(username!) saved")
        }
    }

    func showAlert(title: String, message: String) {
        // create alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        // buttonOk create
        let buttonOk = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // buttonOk click
        }
        // buttonOk add alert
        alert.addAction(buttonOk)
        
        // show alert
        self.present(alert, animated: true, completion: nil)
    }
}

