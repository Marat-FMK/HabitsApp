//
//  ContentView.swift
//  HabitsApp
//
//  Created by Marat Fakhrizhanov on 08.10.2024.
//

import SwiftUI

struct HabbitsList: View {
    @State private var hobits = Hobits()
    
    @State private var showAddView = false
    
    var body: some View {
        NavigationStack {
            List(hobits.list, id: \.self ) { hobit in
                NavigationLink( "hobit - '\(hobit.name)' ") {
                    AboutHobit(hobit: hobit, hobits: hobits)
                }
            }
            
            .toolbar {
                ToolbarItemGroup( placement: .topBarTrailing) {
                    Button(action: { hobits.list.removeAll() } ) {
                        Text("remove")
                    }
                    
                    Button(action: { showAddView.toggle() } ) {
                        Text("+")
                            .font(.title)
                            .tint(.black)
                    }
                    .padding()
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle("Hobist List")
            
            
            
        }
        .sheet(isPresented: $showAddView) {
            AddHobit(hobits: hobits)
        }
    }
}

#Preview {
    HabbitsList()
}
