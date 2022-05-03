//
//  Item.swift
//  TheTrail
//
//  Created by Will Morrow on 2/15/22.
//
import SwiftUI

class Item: Codable, Hashable{
    var name: String
    var icon: String
    var count: Int

    
    init(name: String, icon: String, count: Int){
        self.name = name
        self.icon = icon
        self.count = count
    }
    
    //hashable
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    func getDisplay() -> String{return "generic item found"}
    func getIcon() -> String{return icon}

    // encoding/decoding for ObservablableObject
    //enum CodingKeys: CodingKey {
    //    case name, value
    //}
    //func encode(to encoder: Encoder) throws {
    //    var container = encoder.container(keyedBy: CodingKeys.self)
    //
    //    try container.encode(name, forKey: .name)
    //    try container.encode(value, forKey: .value)
    //}
    //required init(from decoder: Decoder) throws {
    //    let container = try decoder.container(keyedBy: CodingKeys.self)
    //
    //    name = try container.decode(String.self, forKey: .name)
    //    value = try container.decode(Float.self, forKey: .value)
    //}
    
    // initialization for bool achievements
    
}

class UpgradableItem: Item{
    var value: Float
    
    init(name: String, value: Float, icon: String){
        self.value = value
        super.init(name: name, icon: icon, count: 0)
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override func getDisplay() -> String{
        return String(value)
    }
}
class StackableItem: Item{
    
    init(name: String, count: Int, icon: String){
        super.init(name: name, icon: icon, count: count)
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    
    override func getDisplay() -> String{
        return String(count) +  "x"
    }
}

class Weapon: UpgradableItem{
    init(name: String, value: Float){
        super.init(name: name, value: value, icon: "weaponIcon")
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
class FishingPole: UpgradableItem{
    init(name: String, value: Float){
        super.init(name: name, value: value, icon: "fishingIcon")
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
class Wagon: UpgradableItem{
    init(name: String, value: Float){
        super.init(name: name, value: value, icon: "wagonIcon")
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
class Medicine: StackableItem{
    init(name: String, count: Int){
        super.init(name: name, count: count, icon: "medicineIcon")
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
class Ammo: StackableItem{
    init(name: String, count: Int){
        super.init(name: name, count: count, icon: "ammoIcon")
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
