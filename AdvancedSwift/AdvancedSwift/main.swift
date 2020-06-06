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

print("*****")

// TUPLE

let myTuple = (1,3)
print(myTuple.0)
print(myTuple.1)


let myTuple2 = ("A","B","C")
print(myTuple2)
print(myTuple2.1)
print(myTuple2.2)
// myTuple2.2 = 10 is let you cant this

var myTuple3 = ("A","B","C")
print(myTuple3.2)
// myTuple3.2 = 10 you cant this, 2. element is String
myTuple3.2  = "D"
print(myTuple3.2)


var myTuple4 = (10,[1,2,3])
print(myTuple4.1[2]) // 3

let predefinedTuple : (String, String)
predefinedTuple.0 = "Busra"
predefinedTuple.1 = "Okan"
print(predefinedTuple.0)

let newTuple = (name:"James", famale : false)
print(newTuple.name)
print(newTuple.famale)

print("*****")

// GUARD LET vs IF LET

// Guard -> more negative
// If -> more pozitif

let myString = "5"

func convertToIntegerIf(input: String) -> Int{
    if let myInteger = Int(input) {
        return myInteger
    }
    return 0
}

func convertToIntegerGuard(input: String) -> Int{
    // confident
    guard let myInteger = Int(input) else {
        return 0
    }
    return myInteger
}

print(convertToIntegerIf(input: myString))
print(convertToIntegerGuard(input: myString))
