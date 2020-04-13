//
//  PlayViewController.swift
//  CatchHamburger
//
//  Created by Büşra Serdaroğlu on 12.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelHighScore: UILabel!
    
    @IBOutlet weak var hamburgerOne: UIButton!
    @IBOutlet weak var hamburgerTwo: UIButton!
    @IBOutlet weak var hamburgerThree: UIButton!
    @IBOutlet weak var hamburgerFour: UIButton!
    @IBOutlet weak var hamburgerFive: UIButton!
    @IBOutlet weak var hamburgerSix: UIButton!
    @IBOutlet weak var hamburgerSeven: UIButton!
    @IBOutlet weak var hamburgerEight: UIButton!
    @IBOutlet weak var hamburgerNine: UIButton!
    @IBOutlet weak var hamburgerTen: UIButton!
    @IBOutlet weak var hamburgerEleven: UIButton!
    @IBOutlet weak var hamburgerTwelve: UIButton!
    
    var tempHamburgerId = 0
    var timer = Timer()
    var time = 30;
    var highScore = 10;
    var score = 0;
    var selectedHamburger = UIButton()
    var hamburgerClicked  = false
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initGame()
    }

    func initGame() {
        
        //if UserDefaults.standard.
        //highScore = UserDefaults.standard.object(forKey: "highScore") as! Int
               
        labelHighScore.text = "High Score : \(highScore)"
               
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(refreshTime), userInfo: nil, repeats: true)
    }
    
    func updateScore() {
        labelScore.text = "Score : \(score)"
    }
    
    @objc func refreshTime() {
        labelTimer.text = "Time : \(time)"
        if time == 0 {
            // check score and show popup
            timer.invalidate()
            labelTimer.text = "Time is over"
            showAlert()
        } else {
            time -= 1
            changeHamburger()
        }
    }
    
    func changeHamburger() {
        selectedHamburger.isHidden = true
        hamburgerClicked = false
        
        let hamburgerId = Int.random(in: 1 ... 10)
        
        switch hamburgerId {
        case 1:
            hamburgerOne.isHidden = false
            selectedHamburger = hamburgerOne
        case 2:
            hamburgerTwo.isHidden = false
            selectedHamburger = hamburgerTwo
        case 3:
            hamburgerThree.isHidden = false
            selectedHamburger = hamburgerThree
        case 4:
            hamburgerFour.isHidden = false
            selectedHamburger = hamburgerFour
        case 5:
            hamburgerFive.isHidden = false
            selectedHamburger = hamburgerFive
        case 6:
            hamburgerSix.isHidden = false
            selectedHamburger = hamburgerSix
        case 7:
            hamburgerSeven.isHidden = false
            selectedHamburger = hamburgerSeven
        case 8:
            hamburgerEight.isHidden = false
            selectedHamburger = hamburgerEight
        case 9:
            hamburgerNine.isHidden = false
            selectedHamburger = hamburgerNine
        case 10:
            hamburgerTen.isHidden = false
            selectedHamburger = hamburgerTen
        case 11:
            hamburgerEleven.isHidden = false
            selectedHamburger = hamburgerEleven
        case 12:
            hamburgerTwelve.isHidden = false
            selectedHamburger = hamburgerTwelve
        default:
            break
        }
    }
    
    func startAgain() {
        score = 0
        time = 20
        initGame()
    }
    
    func showAlert() {
        var title = "We are sorry :("
        var message = "You couldn't pass the high score, want to play again?"
    
        if score > highScore {
            title = "Congratulations :) "
            message = "You have passed the highest score, want to play again?"
            UserDefaults.standard.set(score, forKey: "highScore")
        }
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in self.startAgain()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func oneClicked(sender: UIButton) {
        if !sender.isHidden && !hamburgerClicked {
            score += 1
            updateScore()
            hamburgerClicked = true
        }
    }
}
