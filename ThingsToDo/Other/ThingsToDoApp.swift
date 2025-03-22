//
//  ThingsToDoApp.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/21/25.
//

import SwiftUI

import FirebaseCore

@main
struct ThingsToDoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
