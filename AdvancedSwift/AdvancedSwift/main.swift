//
//  main.swift
//  AdvancedSwift
//
//  Created by Büşra Serdaroğlu on 6.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

print("Hello, World!")

// you must create init method on musician class
let musicianClassInstance = MusicianClass(nameInput: "Okan", ageInput: 32, instrumentInput: "Guitar")
print(musicianClassInstance.name)

// free initializer
let musicianStructInstance = MusicianStruct(name: "Okan", age: 32, instrument: "Guitar")
print(musicianStructInstance.name)
