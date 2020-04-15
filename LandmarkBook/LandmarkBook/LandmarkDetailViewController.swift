//
//  LandmarkDetailViewController.swift
//  LandmarkBook
//
//  Created by Büşra Serdaroğlu on 15.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class LandmarkDetailViewController: UIViewController {

    @IBOutlet weak var labelLandmarkName: UILabel!
    @IBOutlet weak var imageViewLandmark: UIImageView!
   
    var landmarkImage = UIImage()
    var landmarkName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewLandmark.image = landmarkImage
        labelLandmarkName.text = landmarkName
        
        navigationItem.title = "Detail of \(landmarkName)"
    }
    
}
