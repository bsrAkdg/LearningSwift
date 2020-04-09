//
//  ViewController.swift
//  MyFirstApp
//
//  Created by Büşra Serdaroğlu on 9.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonClick(_ sender: Any) {
        imageView.image = UIImage(named : "metallica2")
    }
}

