//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Büşra Serdaroğlu on 28.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: Any) {
        
        // Firstly, you should Features -> Face ID -> Enrolled,
        // after button click Face ID -> Matching face

        let authContext = LAContext()
        
        var error : NSError?
        // & is pointer
        
        // can evulate check
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            // evulate (evaluatePolicy at backgorund thread)
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success {
                    // successful auth
                    // look at Main Thread Checker
                    // performSegue at main thread, you should use thread!
                    // Updating UI from a Completion Handler
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "goHome", sender: nil)
                    }

                } else {
                    DispatchQueue.main.async {
                        self.labelMessage.text = "Error!"

                    }
                }
            }
        }
    }
}

