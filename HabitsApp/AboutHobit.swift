//
//  AboutHobit.swift
//  HabitsApp
//
//  Created by Marat Fakhrizhanov on 08.10.2024.
//

import SwiftUI

struct AboutHobit: View {
    var hobit: Hobit
    var hobits: Hobits
    
//    @State private var count = 0
    
    var body: some View {
        Spacer()
        HStack {
            Text("Hobit name:")
            Spacer()
            Text(hobit.name)
        }
        .padding()
        
        Divider()
            .background(.purple)
       
        Spacer()
        
        HStack {
            Text("Hobit description:")
            Spacer()
            Text(hobit.description)
        }
        .padding()
        .padding(.bottom,50)
       
        Text(String(hobit.count))
        
        Button("+1") {
            guard let index = hobits.list.firstIndex(of: hobit) else {
                print("no index")
                return }
            hobits.list[index].count += 1
        }
                   
                    
        
        Spacer()
        
        
        
    }
}

#Preview {
    AboutHobit(hobit: Hobit(name: "play song", description: "play on guitar and song", count: 0), hobits: Hobits()
)
}
