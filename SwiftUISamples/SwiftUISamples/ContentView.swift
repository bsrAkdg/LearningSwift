//
//  ContentView.swift
//  SwiftUISamples
//
//  Created by Büşra Serdaroğlu on 7.06.2020.
//  Copyright © 2020 Busra Serdaroglu. All rights reserved.
//

import SwiftUI

// Everything is View
// We can pu new views on body

struct ContentView: View {
    var body: some View {
        
        VStack { // like container, we can put a lot of views on the vstack(vertical), hstack(horizontal), zstack
            Text("Hello, User!")
                      .bold()
                      .italic()
                      .font(.largeTitle)
                      .foregroundColor(Color.blue)
                      .padding()
            Text("Welcome!")
                      .bold()
                      .italic()
                      .font(.title)
                      .foregroundColor(Color.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
