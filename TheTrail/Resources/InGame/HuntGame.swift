//
//  Hunt.swift
//  TheTrail
//
//  Created by Will Morrow on 3/4/22.
//

import Foundation
import SwiftUI

class HuntGame: ObservableObject{
    @Published var ammo: Int
    var childrenTaken: [Person]
    @Published var animals = [Animal]()
    
    init(ammo: Int, childrenTaken: [Person]){
        let seed = Int.random(in: 0..<200)
        self.ammo = ammo
        self.childrenTaken = childrenTaken
        //adding animals
        animals.append(Bunny())
        animals.append(Bunny())
        
        if 110 < seed && seed < 190{
            animals.append(Deer())
            if seed > 160{
                animals.append(Deer())
            }
        }
        
        if seed < 140{
            animals.append(Bunny())
            if seed < 110{
                animals.append(Bunny())
                if seed < 40{
                    animals.append(Bunny())
                }
            }
        }
        if seed > 185{
            animals.append(Bison())
        }
    }
    
    // for testing
    init(){
        ammo = 50
        self.childrenTaken = [Person(name: "Jimmy")]
        animals.append(Bunny())
        animals.append(Deer())
        animals.append(Bison())
    }

    
}
//ForEach(0...2, id: \.self){ row in
//    HStack{
//        ForEach(0...2, id: \.self){ col in
//            Button(action: {}){
//                Image("BushCard")
//                    .resizable()
//                    .renderingMode(.template)
//                    .foregroundColor(game.getColor())
//                    .frame(width: UIScreen.main.bounds.width*0.3, height: UIScreen.main.bounds.width*0.3)
//            }
//        }
//    }
//}
