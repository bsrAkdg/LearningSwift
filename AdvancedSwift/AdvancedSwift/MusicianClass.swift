//
//  MusicianClass.swift
//  AdvancedSwift
//
//  Created by Büşra Serdaroğlu on 6.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

class MusicianClass {
    var name: String
    var age: Int
    var instrument: String
    
    init(nameInput: String, ageInput: Int, instrumentInput: String) {
        self.name = nameInput
        self.age = ageInput
        self.instrument = instrumentInput
    }
    
    func happyBirthday() {
        self.age += 1
    }
    
    
}
