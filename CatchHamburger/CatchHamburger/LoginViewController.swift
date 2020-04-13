//
//  LoginViewController.swift
//  CatchHamburger
//
//  Created by Büşra Serdaroğlu on 12.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func login(_ sender: Any) {
        let username = textFieldUsername.text
        let password = textFieldPassword.text
        
        if username == nil {
            showAlert(title: "Warning", message: "Please enter username")
        }
        
        if password == nil {
            showAlert(title: "Warning", message: "Please enter password")
        }
        
        if UserDefaults.standard.object(forKey: "username") == nil
            || (UserDefaults.standard.object(forKey: "username") as! String) != username {
            showAlert(title: "Error", message: "Please enter valid username and password")
        } else {
            performSegue(withIdentifier: "homePage", sender: nil)
        }
    }
    
    @IBAction func register(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: nil)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        self.present(alert, animated: true, completion: nil)
    }
}
