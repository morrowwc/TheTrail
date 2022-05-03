//
//  FishingGame.swift
//  TheTrail
//
//  Created by Will Morrow on 2/18/22.
//

import Foundation

class FishingGame {
    var poleValue: Float
    var childrenTaken: [Person]
    init(poleValue: Float, childrenTaken: [Person]){
        self.poleValue = poleValue
        self.childrenTaken = childrenTaken
    }
}
