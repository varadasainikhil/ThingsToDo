//
//  RegistrationView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var name : String = ""
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.white, .blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                Spacer()
                
                Text("Sign-up to ThingsToDo")
                    .font(.system(size: 30, weight: .black))
                
                Text("Start completing your tasks")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Form{
                    TextField("Your Full Name", text: $name)
                    
                    TextField("Your Email", text: $email)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Your Password", text: $password)
                    
                    TLButton(title: "Create Account", backgroundColor: .blue){
                        // action for the button
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .frame(height: 400)
                
                Spacer()
                
            }
            
            
            
        }
    }
}
#Preview {
    RegistrationView()
}
