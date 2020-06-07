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
        Text("Hello, User!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
