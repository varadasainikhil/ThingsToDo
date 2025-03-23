//
//  TLButton.swift
//  ThingsToDo
//
//  Created by Sai Nikhil Varada on 3/22/25.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let backgroundColor : Color
    let action : () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                
                Text(title)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    TLButton(title: "Title", backgroundColor: .blue){
        // nil
    }
}
