//
//  NewItem-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel : ObservableObject{
    @Published var title : String = ""
    @Published var dueDate : Date = Date()
    
    init(){
        
    }
    
    func save(){
        
        // get the current User id
        guard let uID = Auth.auth().currentUser?.uid else{
            return
        }
        
        // create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate:Date().timeIntervalSince1970, isDone: false)
        
        // save the model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uID)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
        
        
        
    }
}
