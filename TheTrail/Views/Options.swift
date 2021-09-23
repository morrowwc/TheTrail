//
//  Options.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct Options: View {
    @ObservedObject var game: TrailGame
    var body: some View {
        VStack{
            Text("Options")
                .font(.largeTitle)
                .foregroundColor(game.GameColors[game.ColorIdex])
            ScrollView{
                BoolButton(game: game, text: "Sound")
                BoolButton(game: game, text: "Notifications")
                BoolButton(game: game, text: "Color")
            }
        }
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options(game: TrailGame())
    }
}
