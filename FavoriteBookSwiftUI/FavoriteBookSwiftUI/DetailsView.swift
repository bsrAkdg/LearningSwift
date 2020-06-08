//
//  DetailsView.swift
//  FavoriteBookSwiftUI
//
//  Created by Büşra Serdaroğlu on 8.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    
    var choosenFavoriteElement : FavoriteElements
    var body: some View {
        VStack {
            Image(choosenFavoriteElement.imagename)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(choosenFavoriteElement.name)
                .font(.largeTitle)
                .padding()
            
            Text(choosenFavoriteElement.description)
                .padding()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        // for preview sample
        DetailsView(choosenFavoriteElement: theDarkNight)
    }
}
