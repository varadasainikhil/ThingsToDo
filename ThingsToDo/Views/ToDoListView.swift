//
//  ToDoListItemsView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct ToDoListView: View {
    @State var viewModel = ToDoListViewViewModel()
    private let userId : String
    
    init(userId : String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("ThingsToDo")
            .toolbar{
                Button{
                    //action
                }label: {
                    Image(systemName: "plus.circle")
                }
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "")
}
