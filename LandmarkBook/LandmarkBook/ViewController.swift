//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Büşra Serdaroğlu on 14.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        getLandmarks()
        
        navigationItem.title = "Cities"
    }
    
    func getLandmarks() {
        landmarkNames.append("İstanbul")
        landmarkNames.append("Amsterdam")
        landmarkNames.append("Prague")
        landmarkNames.append("Rome")
        
        landmarkImages.append(UIImage(named: "istanbul")!)
        landmarkImages.append(UIImage(named: "amsterdam")!)
        landmarkImages.append(UIImage(named: "prague")!)
        landmarkImages.append(UIImage(named: "rome")!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailPage", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPage" {
            let index = sender as! Int
            let landmarkDetail = segue.destination as! LandmarkDetailViewController
            landmarkDetail.landmarkImage = landmarkImages[index]
            landmarkDetail.landmarkName = landmarkNames[index]
        }
    }
}

