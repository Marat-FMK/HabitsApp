//
//  Hobits.swift
//  HabitsApp
//
//  Created by Marat Fakhrizhanov on 08.10.2024.
//

import Foundation

struct Hobit: Hashable, Equatable, Codable {
    let id = UUID()
    let name: String
    let description: String
    var count: Int
    
}




@Observable
class Hobits {
    
    
    var list: [Hobit] = []
    
    init() {
        
        guard let data = UserDefaults.standard.data(forKey: "hobitsList") else { print("No data"); return}
        guard let decodeList = try? JSONDecoder().decode([Hobit].self, from: data) else {
            print("Decode failed")
            return }
                
                self.list = decodeList
    }
    
    
}
//        Hobit(name: "play guitar", description: "everytime", count: 0),
//        Hobit(name: "go gum", description: "4 or 5 times of week", count: 0)
