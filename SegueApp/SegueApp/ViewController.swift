//
//  ViewController.swift
//  SegueApp
//
//  Created by Büşra Serdaroğlu on 11.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelFirstViewController: UILabel!
    @IBOutlet weak var textFieldName: UITextField!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func nextPage(_ sender: Any) {
        name = textFieldName.text!
        performSegue(withIdentifier: "nextPageSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Works just before the next page is called
        if segue.identifier == "nextPageSegue" {
            // casting -> as? or as!
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.myName = name
        }
    }
}

