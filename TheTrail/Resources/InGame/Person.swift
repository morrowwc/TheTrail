//
//  Person.swift
//  TheTrail
//
//  Created by Will Morrow on 1/17/22.
//

import Foundation

class Person: ObservableObject, Codable, Hashable, Identifiable{
    var id = UUID()
    @Published var name: String
    @Published var health: Int
    @Published var traits: [String]
    @Published var isTaken: Bool

    //hashable
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(health)
        hasher.combine(traits)
    }
    
    // encoding/decoding for ObservablableObject
    enum CodingKeys: CodingKey {
        case id, name, health, healthTag, traits
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(health, forKey: .health)
        try container.encode(traits, forKey: .traits)
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        health = try container.decode(Int.self, forKey: .health)
        traits = try container.decode([String].self, forKey: .traits)
        self.isTaken = false

    }
    
    init(name: String) {
        self.name = name
        self.health = 100
        self.traits = ["Healthy"]
        self.isTaken = false
    }
    
    func setName(name: String){
        self.name = name
    }
    
    func kill(cause: String){
        self.health = 0
        self.traits = ["Dead", cause]
    }
    
    func addTrait(trait: String){
        if self.traits.contains("Dysentery"){
            if trait == "Dysentery"{
                self.kill(cause: "Double Dysentery")
            }
        }
        else{
            self.traits.append(trait)
        }
    }
}
