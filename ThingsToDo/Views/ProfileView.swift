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
    @StateObject var viewModel = ProfileViewViewModel()
    @State private var showingLoginView = false
    @State private var showingAlert = false
  
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    HStack{
                        Text("Name : ")
                            .bold()
                        Text(user.fullName)
                        
                    }
                    
                    HStack{
                        Text("Email : ")
                            .bold()
                        Text(user.email)

                    }
                    
                    HStack{
                        Text("Member Since : ")
                            .bold()
                        Text("\(Date(timeIntervalSince1970:user.joined).formatted(date:.abbreviated ,time:.omitted))")
                    
                    }
                        
                    Button("Log Out") {
                        if !viewModel.signOut(){
                            showingAlert = true
                        }
                    }
                    .padding(5)
                    .padding(.horizontal, 5)
                    .foregroundStyle(.white)
                    .background(.red)
                    .clipShape(.rect(cornerRadius: 5))
                }
                else{
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
            .onAppear{
                viewModel.fetchUser()
            }
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
