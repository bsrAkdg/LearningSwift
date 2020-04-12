//
//  ViewController.swift
//  TimerProject
//
//  Created by Büşra Serdaroğlu on 11.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var counter = 10
    
    @IBOutlet weak var labelTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Try below code,  while timer works you can't click button, you can't see timer
        /*for time in 1...10 {
            labelTime.text = "Time: \(counter)"
            counter -= 1
            Thread.sleep(forTimeInterval: 1)
        }*/
        
        // Try above code on viewDidAppear()
        
        // Then, try this code, while timer works you can click button and see timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
    }

    override func viewDidAppear(_ animated: Bool) {
        // Try below code,  while timer works you can't click button but you can see timer
        /*counter = 10
        
        for time in 1...10 {
            labelTime.text = "Time: \(counter)"
            counter -= 1
            Thread.sleep(forTimeInterval: 1)
        }*/
    }
    
    @objc func timerFunction() {
        labelTime.text = "Time: \(counter)"
        if counter == 0 {
            timer.invalidate()
            labelTime.text = "Time's over"
        }
        counter -= 1
    }
    
    @IBAction func printMessage(_ sender: Any) {
        print("Button clicked")
    }
    
}

