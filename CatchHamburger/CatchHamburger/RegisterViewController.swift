//
//  RegisterViewController.swift
//  CatchHamburger
//
//  Created by Büşra Serdaroğlu on 12.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldPasswordAgain: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func register(_ sender: Any) {
        let username = textFieldUsername.text
        let password = textFieldPassword.text
        let passwordAgain = textFieldPasswordAgain.text
        
        if username == nil {
            showAlert(title: "Error", message: "Please enter username")
        } else if password == nil {
            showAlert(title: "Error", message: "Please enter password")
        } else if passwordAgain == nil {
            showAlert(title: "Error", message: "Please enter password again")
        } else if password != passwordAgain {
            showAlert(title: "Error", message: "Passwords not matched")
        } else {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(0, forKey: "score")
          
            if (UserDefaults.standard.object(forKey: "highScore") == nil) {
                UserDefaults.standard.set(0, forKey: "highScore")
            }
            
            showAlert(title: "Success", message: "You are saved")
            
            performSegue(withIdentifier: "loginPage", sender: nil)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
        
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
