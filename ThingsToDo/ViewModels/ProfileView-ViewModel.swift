//
//  ProfileView-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject{
    
    @Published var user : User? = nil
    
    init(){
    }
    
    func signOut() -> Bool{
        do {
            try Auth.auth().signOut()
            return true
        } catch {
            return false
        }
    }
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument{[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ??
                                  " ",
                                  fullName: data["fullName"] as? String ?? " ",
                                  email: data["email"] as? String ?? " ",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
}
