//
//  ContentViewViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/23/25.
//

import Foundation
import FirebaseAuth

class ContentViewViewModel : ObservableObject{
    @Published var currentUserId : String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool{
        return Auth.auth().currentUser != nil
    }
}
