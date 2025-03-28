//
//  ToDoListItemView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    var item : ToDoListItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title3).bold()
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
            }
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                if item.isDone{
                    ZStack{
                        Image(systemName: "square")
                            .foregroundStyle(.black)
                        Image(systemName: "checkmark")
                            .foregroundStyle(.red)
                    }
                } else{
                    Image(systemName: "square")
                        .foregroundStyle(.black)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
        }
    }
}

#Preview {
    let temp = ToDoListItem(id: "1233", title: "Get milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
    ToDoListItemView(item: temp)
}
