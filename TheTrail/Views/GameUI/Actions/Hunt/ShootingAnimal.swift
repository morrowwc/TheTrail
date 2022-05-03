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
                        animal.offsetX += 1
                    }
                }){
                    animal.image()
                        .foregroundColor(game.getColor())
                        .onAppear(perform: {animal.move()})
                }
                .offset(x: CGFloat(animal.offsetX))
                .offset(y: CGFloat(animal.offsetY))
            }
    }
}
