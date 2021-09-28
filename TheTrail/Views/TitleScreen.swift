//
//  TitleScreen.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct TitleScreen: View {
    @StateObject var game = TrailGame()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30.0, content:{
                Text("The Trail")
                    .font(.largeTitle)
                    .foregroundColor(game.GameColors[game.ColorIdex])
                NavigationLink(destination: Options(game: game)) {
                    MiscButton(text: "New Game", game: game)
                }
                NavigationLink(destination: Options(game: game)) {
                    MiscButton(text: "Resume", game: game)
                }
                NavigationLink(destination: Options(game: game)) {
                    MiscButton(text: "Acheivements", game: game)
                }
                NavigationLink(destination: Options(game: game)) {
                    MiscButton(text: "Options", game: game)
                }
            })
            .navigationBarHidden(true)
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
