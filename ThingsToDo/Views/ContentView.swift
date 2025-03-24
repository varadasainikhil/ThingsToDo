//
//  ContentView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/21/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewViewModel()
    
    var body: some View {
        VStack {
            NavigationView{
                if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
                    //signedin
                    ToDoListView()
                } else{
                    LoginView()
                }
            }
            
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
