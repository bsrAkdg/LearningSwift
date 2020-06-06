//
//  main.swift
//  AdvancedSwift
//
//  Created by Büşra Serdaroğlu on 6.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

print("Hello, World!")

// CLASS vs STRUCT

// you must create init method on musician class
let musicianClassInstance = MusicianClass(nameInput: "Okan", ageInput: 32, instrumentInput: "Guitar")
print(musicianClassInstance.name)

// free initializer
let musicianStructInstance = MusicianStruct(name: "Okan", age: 32, instrument: "Guitar")
print(musicianStructInstance.name)

musicianClassInstance.age = 33 // age change!
print(musicianClassInstance.age)

// musicianStructInstance.age = 33 // you dont this, structs are true immutability

var musicianNewStructInstance = MusicianStruct(name: "Okan", age: 32, instrument: "Guitar")
musicianNewStructInstance.age = 33 // age change!
print(musicianNewStructInstance.age)

print("*****")


// REFERENCE vs VALUE

let copyOfClassMusicianClass = musicianClassInstance // reference type
var copyOfStructMusicianStruct = musicianNewStructInstance // value type

// Reference types -> Class
// Copy -> Same object new reference -> 1 object 2 reference

// Value types -> Struct
// Copy -> New object create -> 2 object

print(copyOfClassMusicianClass.age)
print(copyOfStructMusicianStruct.age)

copyOfClassMusicianClass.age = 34
copyOfStructMusicianStruct.age = 34

print(copyOfClassMusicianClass.age)
print(copyOfStructMusicianStruct.age)

print(musicianClassInstance.age)
print(musicianNewStructInstance.age)

print("*****")

// MUTATING FUNCTION
print(musicianClassInstance.age)
musicianClassInstance.happyBirthday()
print(musicianClassInstance.age)

print(musicianNewStructInstance.age)
musicianNewStructInstance.happyBirthday()
print(musicianNewStructInstance.age)
