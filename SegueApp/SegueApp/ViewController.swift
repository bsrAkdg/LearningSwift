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
        // Lifecycle
        print("viewDidLoad func called")
        
        // clear text, but
        // when turn back viewDidLoad fun doesn't work,
        // you should use viewWillAppear or viewWillAppear when each page create
        // look at viewDidAppear()
        // textFieldName.text = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear func called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear func called")
        textFieldName.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear func called")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear func called")
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

