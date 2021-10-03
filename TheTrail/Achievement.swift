//
//  Achievement.swift
//  TheTrail
//
//  Created by Will Morrow on 9/28/21.
//

import Foundation

class Achievement {
    var name: String
    var complete = false
    var percentComplete = 0.0
    
    init(name: String){
        self.name = name
    }
}
