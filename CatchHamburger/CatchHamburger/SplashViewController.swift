//
//  SplashViewController.swift
//  CatchHamburger
//
//  Created by Büşra Serdaroğlu on 12.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "username") == nil {
            performSegue(withIdentifier: "loginPage", sender: nil)
        } else {
            performSegue(withIdentifier: "homePage", sender: nil)
        }
    }
}
