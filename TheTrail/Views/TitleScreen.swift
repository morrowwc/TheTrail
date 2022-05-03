//
//  TitleScreen.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct TitleScreen: View {
    @EnvironmentObject var game: TrailGame
    
    var body: some View {
        game.save()
        return NavigationView { 
            ZStack {
                //Background
                game.getBGColor()
                    .ignoresSafeArea()
                //view
                VStack(alignment: .center, spacing: 20.0, content:{
                    MovingTitle(title: "The Trail")
                    Button(action: {game.newGameIsPresented.toggle()}){
                    MiscButton(text: "New Game", width: 0.95, height: 0.3)
                    }
                    Button(action: {game.continueGameIsPresented.toggle()}){
                        MiscButton(text: "Continue", width: 0.95, height: 0.3)
                    }
                    NavigationLink(destination: Achievements()) {
                        MiscButton(text: "Acheivements", width: 0.95, height: 0.3)
                    }
                    NavigationLink(destination: Options()) {
                        MiscButton(text: "Options", width: 0.95, height: 0.3)
                        
                    }
                })
                .disabled(game.newGameIsPresented)
                .navigationBarHidden(true)
            }
            .onAppear(perform: {
                game.newGameIsPresented = false
                game.continueGameIsPresented = false
            })
            .popup(isPresented: game.newGameIsPresented, content: GameSelect( isPresented: $game.newGameIsPresented, isNew: true))
            .popup(isPresented: game.continueGameIsPresented, content: GameSelect( isPresented: $game.continueGameIsPresented, isNew: false))
            //achievement popups
            .popup(isPresented: game.achievements[0].isPresented, content: GetAchievement(achvnum: 0, isPresented: $game.achievements[0].isPresented))
            .popup(isPresented: game.achievements[1].isPresented, content: GetAchievement(achvnum: 1, isPresented: $game.achievements[1].isPresented))
            
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TitleScreen()
                .previewDevice("iPhone 12 Pro Max")
                .environmentObject(TrailGame())
        }
    }
}
