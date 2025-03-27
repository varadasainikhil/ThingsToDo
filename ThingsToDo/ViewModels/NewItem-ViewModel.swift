//
//  NewItem-ViewModel.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import Foundation

class NewItemViewViewModel : ObservableObject{
    @Published var title : String = ""
    @Published var dueDate : Date = Date()
    
    init(){
        
    }
    
    func save(){
        
    }
}
