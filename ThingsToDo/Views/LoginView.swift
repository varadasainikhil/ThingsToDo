//
//  LoginView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    
    
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
                //Login Form
                Form{
                    TextField("Email Address", text: $email)
                        
                    SecureField("Password", text: $password)
                        
                    Button{
                        // attempt login
                    } label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.blue)
                            
                            Text("Submit")
                                .bold()
                                .foregroundStyle(.white)
                        }
                    }
    
                    
                    
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .frame(width: 370, height: 200)
                
                
                Spacer()
                // create form
                
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
