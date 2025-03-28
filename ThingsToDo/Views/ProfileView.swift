//
//  ProfileView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ProfileView: View {
    @State var viewModel = ProfileViewViewModel()
    @State private var showingLoginView = false
    @State private var showingAlert = false
  
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("Place holder text")
                
                Button("Log Out") {
                    do{
                        try Auth.auth().signOut()
                        showingLoginView = true
                    }
                    catch{
                        showingAlert = true
                    }
                    
                }
            }
            .navigationTitle("Profile")
            .alert("Error", isPresented: $showingAlert){
                //
            } message: {
                Text("Error signing you out.")
            }
        }
    }
}

#Preview {
    ProfileView()
}
