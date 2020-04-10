//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Büşra Serdaroğlu on 10.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldBirthday: UITextField!
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting : as? vs as!
        if let name = storedName as? String {
            labelName.text = "Name : \(name)"
        }
        
        if let birthday = storedBirthday as? String {
            labelBirthday.text = "Birthday : \(birthday)"
        }
    }

    @IBAction func saveBirthday(_ sender: Any) {
        
        UserDefaults.standard.set(textFieldName.text!, forKey: "name")
        UserDefaults.standard.set(textFieldBirthday.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        labelName.text = "Name : \(textFieldName.text!)"
        labelBirthday.text = "Birthday : \(textFieldBirthday.text!)"
    }
    @IBAction func deleteBirthday(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil { // "" vs nil
            UserDefaults.standard.removeObject(forKey: "name")
            labelName.text = "Name : "
        }
        
        if (storedBirthday as? String) != nil { // "" vs nil
            UserDefaults.standard.removeObject(forKey: "birthday")
            labelBirthday.text = "Birthday : "
        }
    }
    
}

