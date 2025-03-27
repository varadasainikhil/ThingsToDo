//
//  ToDoListItemsView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
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
                    viewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus.circle")
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewItemView()
                }
            }
        }
        
    }
}

#Preview {
    ToDoListView(userId: "")
}
