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
        
        List{
            ForEach(myFavorites) { favorite in
                Section(header: Text(favorite.title)) {
                    ForEach(favorite.elements) { element in
                        Text(element.name)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
