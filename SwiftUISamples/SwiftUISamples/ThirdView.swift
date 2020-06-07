
//
//  ThirdUIView.swift
//  SwiftUISamples
//
//  Created by Büşra Serdaroğlu on 7.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct ThirdView: View {
    
    let myArray = ["James", "Lars", "Kirk", "Rob"]
    
    var body: some View {

        // Way One
        List(myArray, id: \.self){ element in // id required
            Image("winnie").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 50)
            Text(element).font(.title).padding()
            
        }
        
        // Way Two
        /*List {
            ForEach(myArray, id: \.self){ element in
                
                Image("winnie").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 50)
                Text(element).font(.title).padding()
            }
        }*/
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
