//
//  NewItemView.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct NewItemView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var newItem = NewItemViewViewModel()
    @State private var showingAlert = false
    @State var errorMessage = ""
    
    let emptyTitleMessage = "Please Enter the Title of the task"
    let pastDateOrTimeMessage = "Date or Time of the task is in the past."
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Form{
                    //Title
                    TextField("Enter your task ", text: $newItem.title)
                        
                    
                    //Due Date
                    DatePicker("Select your due date", selection: $newItem.dueDate)
                        .datePickerStyle(.graphical)
                    
                }
            }
            .alert("Error", isPresented: $showingAlert){
                // nothing
            } message :{
                Text(errorMessage)
            }

            .padding(.top)
            .navigationTitle("New Item")
            .toolbar{
                Button("Save"){
                    if newItem.title.trimmingCharacters(in: .whitespaces).isEmpty{
                        errorMessage = emptyTitleMessage
                        showingAlert = true
                    }
                    else if newItem.dueDate < Date(){
                        errorMessage = pastDateOrTimeMessage
                        showingAlert = true
                    }
                    else{
                        newItem.save()
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewItemView()
}
