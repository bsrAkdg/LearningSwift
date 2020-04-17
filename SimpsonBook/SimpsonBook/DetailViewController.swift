//
//  DetailViewController.swift
//  SimpsonBook
//
//  Created by Büşra Serdaroğlu on 17.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageViewSimpson: UIImageView!
    @IBOutlet weak var labelJob: UILabel!
    
    var simpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelName.text = simpson?.name
        labelJob.text = simpson?.job
        imageViewSimpson.image = simpson?.image
    }
  
}
