//
//  MovingAnimal.swift
//  TheTrail
//
//  Created by Will Morrow on 3/8/22.
//

import SwiftUI

struct MovingAnimal: View {
    @EnvironmentObject var game: TrailGame
    @ObservedObject var animal: Animal
    @Binding var ammo: Int
    var animalCount: Int
    
    var body: some View {
        return
            ZStack{
                Button(action: {
                    if ammo > 0{
                        ammo -= 1
                    }
                }){
                    Rectangle()
                        .fill(.clear)
                }
                
                Button(action: {
                    if ammo > 0{
                        ammo -= 1
                        animal.health -= 10*game.savedGame().gunLevel
                    }
                }){
                    animal.image()
                        .foregroundColor(game.getColor())
                        .rotationEffect(Angle(degrees: animal.angle))
                }
                .disabled(!animal.isAlive())
                .offset(x: CGFloat(animal.offsetX))
                .offset(y: CGFloat(animal.offsetY))
            }
            
    }
}
