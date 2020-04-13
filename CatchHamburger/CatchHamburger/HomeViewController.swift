//
//  HomeViewController.swift
//  CatchHamburger
//
//  Created by Büşra Serdaroğlu on 12.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var labelWelcome: UILabel!
    @IBOutlet weak var labelHighScore: UILabel!
    
    var username = ""
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelWelcome.text = "Welcome \(username)!"
        labelHighScore.text = "Score : \(score)"
    }
 
    @IBAction func startPlay(_ sender: Any) {
        performSegue(withIdentifier: "playPage", sender: nil)
    }
    
    @IBAction func logout(_ sender: Any) {
        performSegue(withIdentifier: "loginPage", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playPage" {
            let playPage = PlayViewController()
            playPage.username = username
        } else if segue.identifier == "loginPage" {
            UserDefaults.standard.set(nil, forKey: "username")
            UserDefaults.standard.set(nil, forKey: "score")
        }
    }
}
