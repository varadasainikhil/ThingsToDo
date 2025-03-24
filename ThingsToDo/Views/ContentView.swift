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
                    TabView{
                        ToDoListView(userId: viewModel.currentUserId)
                            .tabItem{
                                Label("Home", systemImage: "house")
                            }
                        
                        ProfileView()
                            .tabItem{
                                Label("Profile", systemImage: "person.circle")
                            }
                    }
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
