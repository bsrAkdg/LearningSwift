//
//  SecondView.swift
//  SwiftUISamples
//
//  Created by Büşra Serdaroğlu on 7.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack{
            Image("winnie")
            .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 400.0, height: 200.0) // static size
            
            Image("winnie")
            .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height *
                    0.3) // dynamic size
        }

    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
