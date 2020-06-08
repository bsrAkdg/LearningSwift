//
//  FavoriteModel.swift
//  FavoriteBookSwiftUI
//
//  Created by Büşra Serdaroğlu on 8.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import Foundation

struct FavoriteModel : Identifiable {
    
    // id must when implemented Identifiable
    var id = UUID() // if you want use "var id = Int" you should set it by yourself,
    
    var title : String
    var elements : [FavoriteElements]
    
}

struct FavoriteElements : Identifiable {
    
    var id = UUID()
    var name : String
    var imagename : String
    var description : String
}


// Bands
let metallica = FavoriteElements(name: "Metallica", imagename: "metallica", description: "Best music 1!!!!")
let megadeth = FavoriteElements(name: "Megadeth", imagename: "megadeth", description: "Best music 2!!!!")
let ironmaiden = FavoriteElements(name: "Ironmaiden", imagename: "ironmaiden", description: "Best music 3!!!!")

let favoriteBand = FavoriteModel(title: "Favorite Bands", elements: [metallica, megadeth, ironmaiden])

// Moview
let pulpFiction = FavoriteElements(name: "Pulpfiction", imagename: "pulpfiction", description: "No 1 Movie")
let theDarkNight = FavoriteElements(name: "The Dark Night", imagename: "thedarknight", description: "No 2 Movie")
let killBill = FavoriteElements(name: "Kill Bill", imagename: "killbill", description: "No 3 Movie")

let favoriteMovie = FavoriteModel(title: "Favorite Movies", elements: [pulpFiction, theDarkNight, killBill])

let myFavorites = [favoriteBand, favoriteMovie]
