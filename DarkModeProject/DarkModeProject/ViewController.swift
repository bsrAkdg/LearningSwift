//
//  ViewController.swift
//  DarkModeProject
//
//  Created by Büşra Serdaroğlu on 27.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonChange: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // User light mode in this controller
        overrideUserInterfaceStyle = .light
        
        // if you add User Interface Style to info.plist Dark or Light : Enforce!
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // get user ui mode with traitCollection
        // viewWillAppear and viewDidLoad dont update when app open, we should use traitCollectionDidChange
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        if userInterfaceStyle == .dark {
            buttonChange.tintColor = UIColor.white
        } else {
            buttonChange.tintColor = UIColor.black
        }
    }
}

