//
//  ContentView.swift
//  FavoriteBookSwiftUI
//
//  Created by Büşra Serdaroğlu on 8.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{ // use with NavigationLink
            List{
                ForEach(myFavorites) { favorite in
                      Section(header: Text(favorite.title)) {
                          ForEach(favorite.elements) { element in
                              // Navigation click event
                              NavigationLink(destination: DetailsView()) {
                                  Text(element.name)
                              }
                          }
                      }
                  }
            }.navigationBarTitle(Text("Favorite Book"))
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
