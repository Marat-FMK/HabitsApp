//
//  AddHobit.swift
//  HabitsApp
//
//  Created by Marat Fakhrizhanov on 08.10.2024.
//

import SwiftUI

struct AddHobit: View {
    var hobits: Hobits
    
    
    @Environment(\.dismiss) var dismiss
    @State private var hobitName = "1"
    @State private var hobitDescription = "3"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Inter the hobit name:")
            
            
            TextField("hobit name", text: $hobitName)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 50)
            
            Text("Inter hobit description:")
            
            TextField("hobit description", text: $hobitDescription)
            
        }
        .padding()
        
            Button(action: {
                
                hobits.list.append(Hobit(name: hobitName, description: hobitDescription, count: 0))
                
                let list = hobits.list
                
                guard let data = try? JSONEncoder().encode(list) else {
                    print("Failed encode")
                          return }
                
                          UserDefaults.standard.set(data, forKey: "hobitsList")
                
                
                
                
                dismiss()
                
            } ) {
                Text("save hobit")
            }
               
    }
    
  
        
    
}

#Preview {
    AddHobit(hobits: Hobits.init())
}
