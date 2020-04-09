import UIKit

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




