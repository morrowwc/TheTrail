//
//  TrailGame.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI
import Foundation

class TrailGame: ObservableObject {
    @Published var ColorIdex = 0
    @Published var sounds = true
    @Published var notifications = true

    let GameColors = [
        Color(red: 0.0, green: 0.0, blue: 1.0),
        Color(red: 0.0, green: 1.0, blue: 0.0),
        Color(red: 1.0, green: 0.0, blue: 0.0)
    ]

    func UpdateColor(index: Int){
        self.ColorIdex = index
    }
    init(){
    }
}


