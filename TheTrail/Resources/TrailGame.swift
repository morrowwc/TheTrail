//
//  TrailGame.swift
//  TheTrail
//
//  Created by Will Morrow on 11/9/21.
//

import SwiftUI

class TrailGame: ObservableObject{
    @Published var ColorIndex: Int
    @Published var BGColorIndex: Int
    @Published var sounds: Bool
    @Published var notifications: Bool
    @Published var achievements: [Achievement]
    @Published var savedGames: [SavedGame]
    var sgIndex: Int
    @Published var newGameIsPresented: Bool
    @Published var continueGameIsPresented: Bool

    let defautAchievements = [
        Achievement(name: "Lights Out", complete: false, beenPresented: false),
        Achievement(name: "Blinded by the Light", complete: false, beenPresented: false)
    ]
    
    let GameColors = [
        Color.black,
        Color.white,
        Color.blue,
        Color.red,
        Color.green,
        Color.pink,
        Color.orange,
    ]
    
    //initialization
    init(){
        //recovering saved data
        // ColorIndex
        if let data = UserDefaults.standard.data(forKey: "ColorIndex"){
            if let decoded = try? JSONDecoder().decode(Int.self, from: data){
                self.ColorIndex = decoded
            }
            else{self.ColorIndex = 2}
        }
        else{self.ColorIndex = 2}
        
        // BGColorIndex
        if let data = UserDefaults.standard.data(forKey: "BGColorIndex"){
            if let decoded = try? JSONDecoder().decode(Int.self, from: data){
                self.BGColorIndex = decoded
            }
            else{self.BGColorIndex = 0}
        }
        else{self.BGColorIndex = 0}
        
        // sounds
        if let data = UserDefaults.standard.data(forKey: "sounds"){
            if let decoded = try? JSONDecoder().decode(Bool.self, from: data){
                self.sounds = decoded
            }
            else{self.sounds = true}
        }
        else{self.sounds = true}
        
        // notifications
        if let data = UserDefaults.standard.data(forKey: "notifications"){
            if let decoded = try? JSONDecoder().decode(Bool.self, from: data){
                self.notifications = decoded
            }
            else{self.notifications = true}
        }
        else{self.notifications = true}
        
        //achievements
        if let data = UserDefaults.standard.data(forKey: "achievements"){
            if let decoded = try? JSONDecoder().decode([Achievement].self, from: data){
                self.achievements = decoded
            }
            else{self.achievements = defautAchievements}
        }
        else{self.achievements = defautAchievements}
        
        //saved games
        if let data = UserDefaults.standard.data(forKey: "savedGames"){
            if let decoded = try? JSONDecoder().decode([SavedGame].self, from: data){
                self.savedGames = decoded
            }
            else{self.savedGames = [SavedGame(), SavedGame(), SavedGame()]}
        }
        else{self.savedGames = [SavedGame(), SavedGame(), SavedGame()]}
        // saved game index
        if let data = UserDefaults.standard.data(forKey: "sgIndex"){
            if let decoded = try? JSONDecoder().decode(Int.self, from: data){
                self.sgIndex = decoded
            }
            else{self.sgIndex = 0}
        }
        else{self.sgIndex = 0}
        
        self.newGameIsPresented = false
        self.continueGameIsPresented = false
    }
    
    func save() {
        checkAchievements()
        if let encoded = try? JSONEncoder().encode(ColorIndex){
            UserDefaults.standard.set(encoded, forKey: "ColorIndex")
        }
        if let encoded = try? JSONEncoder().encode(BGColorIndex){
            UserDefaults.standard.set(encoded, forKey: "BGColorIndex")
        }
        if let encoded = try? JSONEncoder().encode(sounds){
            UserDefaults.standard.set(encoded, forKey: "sounds")
        }
        if let encoded = try? JSONEncoder().encode(notifications){
            UserDefaults.standard.set(encoded, forKey: "notifications")
        }
        if let encoded = try? JSONEncoder().encode(achievements){
            UserDefaults.standard.set(encoded, forKey: "achievements")
        }
        if let encoded = try? JSONEncoder().encode(savedGames){
            UserDefaults.standard.set(encoded, forKey: "savedGames")
        }
        if let encoded = try? JSONEncoder().encode(sgIndex){
            UserDefaults.standard.set(encoded, forKey: "sgIndex")
        }
    }
    
    //navigatation functions
    func getColor() -> Color{
        return GameColors[ColorIndex]
    }
    
    func getBGColor() -> Color{
        return GameColors[BGColorIndex]
    }
    
    func savedGame() -> SavedGame{
        return savedGames[sgIndex]
    }
    
    func getCharacter(index: Int) -> Person{
        return savedGame().family[index]
    }
    
    func isOver() -> Bool{
        savedGame().isOver
    }
    
    func checkAchievements(){
        // Lights Out
        if BGColorIndex == 0 && ColorIndex == 0 {
            achievements[0].check()
        }
        // Blinded by the Light
        if self.BGColorIndex == 1 && self.ColorIndex == 1 {
            achievements[1].check()
        }
    }
    
    //In-games functions
    func moveButton(){
        savedGames[sgIndex].screenIsMoving.toggle()
        self.move1()
    }
    
    func move1(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
            if self.savedGames[self.sgIndex].food == 0 {
                self.savedGames[self.sgIndex].isOver = true
                self.savedGames[self.sgIndex].screenIsMoving = false
            }
            else if self.screenIsMoving(){
                self.move2()
            }
        }
    }
    
    func move2(){
        savedGames[sgIndex].food -= 1
        savedGames[sgIndex].distance -= 1
        self.move1()
    }
    
    func screenIsMoving() -> Bool {
        return savedGames[sgIndex].screenIsMoving
    }
    
    func addFamilyMember(name: String){
        savedGames[sgIndex].addFamilyMember(name: name)
    }
}
