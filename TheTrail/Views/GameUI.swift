//
//  GameUI.swift
//  TheTrail
//
//  Created by Will Morrow on 10/7/21.
//

import SwiftUI

struct GameUI: View {
    @ObservedObject var game: TrailGame

    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
                .border(game.GameColors[game.ColorIdex], width: 8.0)
            MiscButton(text: "Button", game: game)
            MiscButton(text: "Button", game: game)
        }
    }
}

struct GameUI_Previews: PreviewProvider {
    static var previews: some View {
        GameUI(game: TrailGame())
    }
}
