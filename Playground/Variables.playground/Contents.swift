import UIKit

// PART ONE : Variables & Consttants
// var : mutable
// let : immutable

// snake case naming:
var user_nick = "Ayse"

// camelCase naming:
var userNick = "Ayse"

// Variable Types : String, integer, double, float

// String
var userName = "Ayse"
var userSurname = "Çetin"

userName.append("l")
print(userName)
userName.uppercased()
print(userName)

print(userSurname)
userSurname = "Yılmaz"
print(userSurname)

let userAge = 50

// userAge = 30 error : userAge immutable

let pi = 3.14

// userAge * pi error : different types

var radius = 2.5
var field = pi * radius * radius
print(field)

// integer
var userCode = 50
var myNumber = 4
print(userCode/myNumber) // result is Integer

// double
var userCodeD = 50.0
var myNumberD = 4.0
print(userCodeD/myNumberD) // result is Double

// boolean
var myBoolean = true
myBoolean = false

// PART TWO : Define variable types
    
var myString : String = "50"
let myIntNumber : Int = 50
let myDoubleNumber : Int = Int(30.0)

// 1. define
let myVariable : String // null
// myVariable.uppercased() error, need initialization

// 2. initialization
myVariable = "Fatma"
print(myVariable.uppercased())




