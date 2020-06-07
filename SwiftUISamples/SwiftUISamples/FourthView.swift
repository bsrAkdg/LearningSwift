//
//  FourthView.swift
//  SwiftUISamples
//
//  Created by Büşra Serdaroğlu on 7.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

struct FourthView: View {
    @State var myName = "Busra"

    
    var body: some View {
        
        VStack{
            Text(myName)
                .padding()
                .font(.largeTitle)

            Button(action: {
                // myName = "Okan" // error
                self.myName = "Okan" // add @State annotation to myName
            }) {
                
                Text("My Button")
            }
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
