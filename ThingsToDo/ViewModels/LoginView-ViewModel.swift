//
//  LoginView-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation

class loginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login(){
        
    }
    
    func validate(){
        
    }
}
