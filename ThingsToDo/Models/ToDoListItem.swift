//
//  ToDoListItem.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation

struct ToDoListItem : Codable, Identifiable{
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state : Bool){
        isDone = state
    }
}
