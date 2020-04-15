//
//  Musicians.swift
//  MusicianClass
//
//  Created by Büşra Serdaroğlu on 15.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

class Musicians {
    
    // Property
    var name : String
    var age : Int
    var instrument : String
    var type : MusicianType
    
    // Initializer (Constructor)
    init(nameInit: String, ageInit: Int, instrumentInit: String, typeInit: MusicianType) {
        print("Musician created")
        name = nameInit
        age = ageInit
        instrument = instrumentInit
        type = typeInit
    }
}

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassit
    case Violenist
}
