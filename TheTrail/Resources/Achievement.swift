//
//  Achievement.swift
//  TheTrail
//
//  Created by Will Morrow on 11/10/21.
//

import SwiftUI

class Achievement: ObservableObject, Codable {
    var name: String
    @Published var complete: Bool
    @Published var beenPresented: Bool
    @Published var isPresented: Bool
    @Published var percent: Float
    
    func check(){
        complete = true
        if(!beenPresented){
            isPresented = true
        }
    }
    
    // encoding/decoding for ObservablableObject
    enum CodingKeys: CodingKey {
        case name, complete, beenPresented, isPresented, percent
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(name, forKey: .name)
        try container.encode(complete, forKey: .complete)
        try container.encode(beenPresented, forKey: .beenPresented)
        try container.encode(isPresented, forKey: .isPresented)
        try container.encode(percent, forKey: .percent)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decode(String.self, forKey: .name)
        complete = try container.decode(Bool.self, forKey: .complete)
        beenPresented = try container.decode(Bool.self, forKey: .beenPresented)
        isPresented = try container.decode(Bool.self, forKey: .isPresented)
        percent = try container.decode(Float.self, forKey: .percent)

    }
    
    // initialization for bool achievements
    init(name: String, complete: Bool,  beenPresented: Bool) {
        self.name = name
        self.complete = complete
        self.percent = 0
        self.beenPresented = beenPresented
        self.isPresented = complete && !beenPresented
    }
    
    //for progressive acheievements
    init(name: String, complete: Bool, beenPresented: Bool, percent: Float) {
        self.name = name
        self.complete = complete
        self.percent = percent
        self.beenPresented = beenPresented
        self.isPresented = complete && !beenPresented
    }
    
    // for previews
    init() {
        self.name = "Achievement"
        self.complete = true
        self.percent = 1.0
        self.beenPresented = false
        self.isPresented = true
    }
    
}
