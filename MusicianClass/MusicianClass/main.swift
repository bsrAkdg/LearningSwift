//
//  main.swift
//  MusicianClass
//
//  Created by Büşra Serdaroğlu on 15.04.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

let james = Musicians(nameInit: "James", ageInit: 50, instrumentInit: "Guitar", typeInit: .Vocalist)

//james.age = 50
//james.name = "James Hetfield"
//james.instrument = "Guitar"

print(james.name)
print(james.type)
james.sing()

let kirk = SuperMusician(nameInit: "Kirk", ageInit: 55, instrumentInit: "Guitar", typeInit: .LeadGuitar)
print(kirk.name)
print(kirk.type)

// you cand this
kirk.sing2()
//you cant this
// james.sing2()

// override sing method on SuperMusician
kirk.sing()
james.sing()
