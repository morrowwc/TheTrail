//
//  savedGameButton.swift
//  TheTrail
//
//  Created by Will Morrow on 2/1/22.
//

import SwiftUI

struct SavedGameButton: View {
    @EnvironmentObject var game: TrailGame
    var index: Int
    var isNew: Bool

    var body: some View {
        if index == 4{
                ZStack(alignment: .center){
                    Rectangle()
                        .fill(game.getBGColor())
                        .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.3)
                        .border(game.getColor(), width: 8.0)
                    Text("New Game")
                        .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.width*0.2)
                        .font(.system(size: UIScreen.main.bounds.width/17))

                }
                .foregroundColor(game.getColor())

        }
        else{
            ZStack(alignment: .center){
                Rectangle()
                    .fill(game.getBGColor())
                    .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.width*0.3)
                    .border(game.getColor(), width: 8.0)
                VStack {
                    if isNew{
                        Text("OVERWRITE")
                    }
                    Text(game.savedGames[index].family[0].name + "'s Save")
                    Text(String(game.savedGames[index].distance) + " miles left")
                }
                    .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.width*0.2)
                    .font(.system(size: UIScreen.main.bounds.width/17))
            }
                .foregroundColor(game.getColor())
        }
    }
}

struct savedGameButton_Previews: PreviewProvider {
    static var previews: some View {
        SavedGameButton(index: 4, isNew: true)
            .environmentObject(TrailGame())
    }
}
