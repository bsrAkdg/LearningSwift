//
//  ViewController.swift
//  GestureRecognizerProject
//
//  Created by Büşra Serdaroğlu on 11.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var index = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        imageView.isUserInteractionEnabled = true
    
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changeImageAndLabel))
    
        imageView.addGestureRecognizer(gestureRecognizer)
    
    }

    @objc func changeImageAndLabel() {
        if index == 0 {
            imageView.image = UIImage(named: "turkiye2")
            label.text = "Map of Turkey"
            index = 1
        } else {
            imageView.image = UIImage(named: "turkiye")
            label.text = "Flag of Turkey"
            index = 0
        }
    }
}

