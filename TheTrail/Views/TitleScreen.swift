//
//  TitleScreen.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct TitleScreen: View {
    @StateObject var game = TrailGame()
    @State private var showingOption = false
    //let buttonNames = ["New Game", "Resume", "Achievments", "Options"]

    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 30.0, content:{
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
            .navigationBarTitle(Text("The Trail"), displayMode: .automatic)

//            .toolbar {
//                Text("The Trail")
//                    .padding(150)
//                    .font(.largeTitle)
//                    .foregroundColor(game.GameColors[game.ColorIdex])
//            }
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
