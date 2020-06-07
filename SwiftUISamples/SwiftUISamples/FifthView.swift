//
//  FifthView.swift
//  SwiftUISamples
//
//  Created by Büşra Serdaroğlu on 7.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct FifthView: View {
    
    @State var myName = "Busra"
    
    var body: some View {
        
        VStack{
            Text(myName)
                .padding()
                .font(.largeTitle)

            TextField("Title", text: $myName) // $ is binding
        }
    }
}

struct FifthView_Previews: PreviewProvider {
    static var previews: some View {
        FifthView()
    }
}
