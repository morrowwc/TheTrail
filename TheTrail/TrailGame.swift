//
//  TrailGame.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI
import Foundation

class TrailGame: ObservableObject {
    let GameColors = [
        Color(red: 0.0, green: 0.0, blue: 1.0),
        Color(red: 0.0, green: 1.0, blue: 0.0),
        Color(red: 1.0, green: 0.0, blue: 0.0)
    ]
    @Published var GameColorText: [Text]
    var ColorIdex = 0
    func UpdateColor(index: Int){
        self.ColorIdex = index
        self.GameColorText = [
            Text("Blue"    ).foregroundColor(self.GameColors[self.ColorIdex]),
            Text("Green"   ).foregroundColor(self.GameColors[self.ColorIdex]),
            Text("Red"     ).foregroundColor(self.GameColors[self.ColorIdex])
        ]
    }
    init(){
        self.GameColorText = [
            Text("Blue"    ).foregroundColor(self.GameColors[self.ColorIdex]),
            Text("Green"   ).foregroundColor(self.GameColors[self.ColorIdex]),
            Text("Red"     ).foregroundColor(self.GameColors[self.ColorIdex])
        ]
    }
}


