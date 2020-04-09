import UIKit

// LOOPS : depends condition : while, for

var myNumber = 1

myNumber += 1

myNumber

// While

myNumber = 0
while myNumber <= 15 {
    print(myNumber)
    myNumber += 1
}

var characterAlive = true

while characterAlive {
    print("Character alive")
    characterAlive = false
}

// For

var myFruit = ["Banana", "Apple", "Orange"]

for fruit in myFruit {
    print(fruit)
}


var myNumbers = [10, 20, 30, 40, 50]

for number in myNumbers {
    print(number/5)
}

for number in 1 ... 5 {  [1,5]
    print(number)
}
