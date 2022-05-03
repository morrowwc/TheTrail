//
//  SavedGame.swift
//  TheTrail
//
//  Created by Will Morrow on 1/7/22.
//

import Foundation

class SavedGame: ObservableObject, Codable{
    @Published var family: [Person]
    @Published var items: [Item]
    @Published var food: Int
    @Published var distance: Int
    var gunLevel: Int
    var fishingRodLevel: Int
    //var gunLevel = 1

    @Published var screenIsMoving: Bool
    @Published var isOver: Bool
    @Published var notSetUp: Bool
    
    // encoding/decoding for ObservablableObject
    enum CodingKeys: CodingKey {
        case family, items, food, distance, screenIsMoving, isOver, notSetUp, gunLevel, fishingRodLevel
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(food, forKey: .food)
        try container.encode(items, forKey: .items)
        try container.encode(distance, forKey: .distance)
        try container.encode(family, forKey: .family)
        try container.encode(screenIsMoving, forKey: .screenIsMoving)
        try container.encode(isOver, forKey: .isOver)
        try container.encode(notSetUp, forKey: .notSetUp)
        try container.encode(gunLevel, forKey: .gunLevel)
        try container.encode(fishingRodLevel, forKey: .fishingRodLevel)

    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        family = try container.decode([Person].self, forKey: .family)
        items = try container.decode([Item].self, forKey: .items)
        food = try container.decode(Int.self, forKey: .food)
        distance = try container.decode(Int.self, forKey: .distance)
        screenIsMoving = try container.decode(Bool.self, forKey: .screenIsMoving)
        isOver = try container.decode(Bool.self, forKey: .isOver)
        notSetUp = try container.decode(Bool.self, forKey: .notSetUp)
        gunLevel = try container.decode(Int.self, forKey: .gunLevel)
        fishingRodLevel = try container.decode(Int.self, forKey: .fishingRodLevel)

    }
    
    init() {
        self.family = [Person(name: "Your Name Here")]
        self.items = [
            Ammo(name: "Ammo", count: 50),
            Weapon(name: "Rusty Revovler", value: 1.0),
            FishingPole(name: "Stick and a Hook", value: 1.0),
            Wagon(name: "Rickety Wagon", value: 1.0),
            Medicine(name: "Cold Remedy", count: 1),
        ]
        self.food = 100
        self.distance = 2000
        self.screenIsMoving = false
        self.isOver = false
        self.notSetUp = true
        self.gunLevel = 1
        self.fishingRodLevel = 1
    }

    func addFamilyMember(name: String){
        family.append(Person(name: name))
    }
    
    func getAmmo() -> Int {
        items[0].count
    }
    func setAmmo(count: Int){
        items[0].count = count
    }
}
