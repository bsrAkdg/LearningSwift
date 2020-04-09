import UIKit

// ARRAY

var myFavoriteMovies = ["Pulp Fiction", "The Godfather", "Forrest Gump"]

// as -> casting
// any -> any object
var myFavoriteThings = ["Coffee", 8, 15.0, false] as [Any]
print(myFavoriteThings[0])
print(myFavoriteThings[1])
print(myFavoriteThings[2])

// print(myFavoriteThings[0].uppercased()) error, myFavoriteThings is Any
print(myFavoriteMovies[0].uppercased()) // myFavoriteMovies is String

print("myFavoriteMovies count :")
print(myFavoriteMovies.count)

print("myFavoriteMovies latest element :")
print(myFavoriteMovies[myFavoriteMovies.count - 1])

myFavoriteMovies.last

var myNumbers = [1, 2, 3, 4, 5, 6] // integer

// SET : each item is unique and items are unordered

var mySet : Set = [1, 2, 3, 4, 5, 2, 3, 4]
print(mySet)

mySet.first // unordered
var myStringSet : Set = ["a", "b", "c", "d", "a", "b"]

var myDefaultArray = [1, 2, 3, 5, 4, 2, 3, 5]
var myNewSet = Set(myDefaultArray)

print("My default array :")
print(myDefaultArray)

print("My new set from my default array :")
print(myNewSet)


var mySet1 : Set = [1, 2, 3]
var mySet2 : Set = [3, 4, 5]
var mySet3 = mySet1.union(mySet2)
print(mySet3)
