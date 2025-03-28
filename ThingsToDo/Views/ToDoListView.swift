//
//  ToDoListItemsView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI
import FirebaseFirestore



struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items : [ToDoListItem]
    
    
    private let userId : String

    init(userId : String){
        self.userId = userId
            
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ToDoListItemView(item: item)
                        .swipeActions(allowsFullSwipe: true){
                            Button("Delete", role:.destructive){
                                viewModel.delete(id: item.id)
                            }
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ThingsToDo")
            .toolbar{
                Button{                    viewModel.showingNewItemView = true
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
    ToDoListView(userId: "mXJhy7jJE0T82WAwvmyTZgk6unQ2")
}
