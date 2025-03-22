//
//  ContentView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/21/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView{
                LoginView()
            }
            
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
