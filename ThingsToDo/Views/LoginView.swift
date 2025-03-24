//
//  LoginView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = loginViewViewModel()
    
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .mint], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("ThingsToDo")
                    .font(.system(size: 50, weight: .black))
                
                Text("Get things done")
                    .font(.system(size: 25, weight: .black))
                
                Spacer()
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                Form{
                    TextField("Email Address", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        
                    SecureField("Password", text: $viewModel.password)
                        
                    TLButton(title: "Log In", backgroundColor: .mint){
                        viewModel.login()
                    }
    
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .frame(height: 300)
                
                
                Spacer()
                
                VStack{
                    Text("Do not have an account?")
                        .font(.callout)
                        .opacity(65)
                    
                    NavigationLink("Sign up now for free"){
                        RegistrationView()
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
