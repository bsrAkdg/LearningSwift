//
//  SecondViewController.swift
//  SegueApp
//
//  Created by Büşra Serdaroğlu on 11.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var labelSecondViewController: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    var myName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        labelName.text = myName
       
    }
    
}
