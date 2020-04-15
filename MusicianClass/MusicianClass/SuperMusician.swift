//
//  SuperMusician.swift
//  MusicianClass
//
//  Created by Büşra Serdaroğlu on 15.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

class SuperMusician: Musicians {
    
    func sing2() {
        print("Enter night")
    }
    
    override func sing() {
        super.sing()
        print("Exit light")
    }
}
