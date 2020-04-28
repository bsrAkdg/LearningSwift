//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Büşra Serdaroğlu on 28.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convert(_ sender: Any) {
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key={YOUR_API_KEY}")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        print(jsonResponse)

                        // Async
                        DispatchQueue.main.async {
                            if let rate = jsonResponse["rates"] as? [String : Any] {
                            
                                if let cad = rate["CAD"] as? Double {
                                    self.cadLabel.text = "CAD : \(cad)"
                                }
                                
                                if let chf = rate["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(chf)"
                                }
                                
                                if let gbp = rate["GBP"] as? Double {
                                    self.gbpLabel.text = "CHF : \(gbp)"
                                }
                                
                                if let jpy = rate["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY : \(jpy)"
                                }
                                
                                if let usd = rate["USD"] as? Double {
                                    self.usdLabel.text = "USD : \(usd)"
                                }
                                
                                if let turkishLira = rate["TRY"] as? Double {
                                    self.tryLabel.text = "TRY : \(turkishLira)"
                                }
                            }
                        }
                    } catch{
                        print("Error!")
                    }
                }
            }
        }
        // start
        task.resume()
        
    }
    
}

