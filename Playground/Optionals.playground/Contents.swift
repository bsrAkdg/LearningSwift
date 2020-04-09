import UIKit

var name: String = "Ayse"

name.uppercased() // OK

var surname: String? // if haven't initialization, so you must add ?

surname?.uppercased() // ? means : maybe give, maybe don't give

surname = "Yılmaz"

print(surname!.uppercased()) // ! means : must have value

var myEmptyString = "" // has value, not nil. It's differet var myEmptyString: String?

// optionals : ? vs !

var myAge = "Not age"

// var myIntegerAge = Int(myAge) * 5 // error : Not certain, maybe myAge cannot be converted to Int

var myIntegerAge = (Int(myAge) ?? 0) * 5 // Way One : if myAge cannot be converted to Int (??) use 0
print(myIntegerAge)

if let myNumber = Int(myAge) { // Way Two : if-let, if myAge can be converted to Int, run block
    print(myNumber * 5)
} else {
    print("Wrong input")
}
