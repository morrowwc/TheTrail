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
    
    init() {
            //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(game.GameColors[game.ColorIdex])]
    }
    
    var body: some View {
        NavigationView {
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
            .navigationBarTitle("The Trail")
        }

    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
