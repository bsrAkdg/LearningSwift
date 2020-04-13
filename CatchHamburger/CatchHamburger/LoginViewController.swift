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
        
        let savedUser = UserDefaults.standard.object(forKey: "username")
        
        let savedUserPassword = UserDefaults.standard.object(forKey: "password")
        
        if savedUser == nil
            || (savedUser as! String) != username {
            showAlert(title: "Error", message: "Please enter an exist username")
        } else if (savedUserPassword as! String) != password  {
            showAlert(title: "Error", message: "Please enter a valid password")
        } else {
             performSegue(withIdentifier: "homePage", sender: nil)
        }
    }
    
    @IBAction func register(_ sender: Any) {
        performSegue(withIdentifier: "registerPage", sender: nil)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
        
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
