//
//  ToDoListView-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView = false

    init(){
        
    }
    
    /// Delete a to do list item
    /// - Parameter id: Id of the To Do list item to be deleted.
    func delete(id : String){
        let db = Firestore.firestore()
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(id)
            .delete()
        
    }
    
}
