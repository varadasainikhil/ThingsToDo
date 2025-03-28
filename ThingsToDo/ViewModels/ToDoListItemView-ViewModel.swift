//
//  ToDoListItemView-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


// View Model for Each item of the ToDo List

class ToDoListItemViewViewModel : ObservableObject{
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(item.isDone)
        itemCopy.isDone.toggle()
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
    
}
