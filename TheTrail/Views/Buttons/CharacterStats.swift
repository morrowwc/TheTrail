//
//  CharaterStats.swift
//  TheTrail
//
//  Created by Will Morrow on 2/16/22.
//

import SwiftUI

struct CharacterStats: View {
    @EnvironmentObject var game: TrailGame
    var char: Person

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.25)
                .border(game.getColor(), width: 8.0)
            HStack{
                Text(char.name)
                Spacer()
                if char.traits[0] != "Healthy"{
                    Text(char.traits[0])
                }
            }
            .offset(y: -15)
            .font(.system(size: 25))
            .foregroundColor(game.getColor())
            .padding(.horizontal, 25)

            ZStack{
                Rectangle()
                Rectangle()
                    .scale(x: CGFloat(char.health/100), anchor: .leading)
                    .fill(game.getColor())
            }
            .frame(width: UIScreen.main.bounds.width*0.85, height: UIScreen.main.bounds.width*0.05)
            .border(game.getColor(), width: 2.0)
            .offset(y: 15)
        }
    }
}

struct CharacterStats_Previews: PreviewProvider {
    static var previews: some View {
        CharacterStats(char: Person(name: "Rando"))
            .environmentObject(TrailGame())
    }
}
