//
//  DetailsViewController.swift
//  ArtBook
//
//  Created by Büşra Serdaroğlu on 17.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldArtist: UITextField!
    @IBOutlet weak var textFieldYear: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // close keyboard when clicked anywhere
        let closeKeyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(closeKeyboardRecognizer)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    @IBAction func savePainting(_ sender: Any) {
        
    }
}
