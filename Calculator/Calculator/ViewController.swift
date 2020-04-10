//
//  ViewController.swift
//  Calculator
//
//  Created by Büşra Serdaroğlu on 10.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldFirstNumber: UITextField!
    @IBOutlet weak var textFieldSecondNumber: UITextField!
    
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sum(_ sender: Any) {
        calculate(transaction:"+")
    }
    
    @IBAction func min(_ sender: Any) {
        calculate(transaction:"-")
    }
    
    @IBAction func div(_ sender: Any) {
        calculate(transaction:"/")
    }
    
    @IBAction func mult(_ sender: Any) {
        calculate(transaction: "*")
    }
    
    func calculate(transaction: Character) {
        
        if textFieldFirstNumber.text != nil
            && textFieldSecondNumber.text != nil {
            if let first = Double(textFieldFirstNumber.text!){
                if let second = Double(textFieldSecondNumber.text!) {
        
                    var result : Double
                    if transaction == "+" {
                        result = first + second
                    } else if transaction == "-" {
                        result = first - second
                    } else if transaction == "/" {
                        result = first / second
                    } else {
                        result = first * second
                    }
                    labelResult.text = String(result)
                }
            }
        }
    }
}

