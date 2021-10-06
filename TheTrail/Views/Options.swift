//
//  Options.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct Options: View {
    @ObservedObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Options")
                .font(.system(size: 60))
                .fontWeight(.bold)
                .foregroundColor(game.GameColors[game.ColorIdex])
            ScrollView{
                Button(action:{ game.sounds.toggle() }) {
                    BoolButton(game: game, text: "Sounds", on: game.sounds)
                }
                Button(action:{ game.notifications.toggle() }) {
                    BoolButton(game: game, text: "Notifications", on: game.notifications)
                }
                ScrollButton(title: "Color", game: game){ScrollColor(currentPage: game.ColorIdex, game: game)}
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(game.GameColors[game.ColorIdex])
                    Text("Home")
                        .foregroundColor(game.GameColors[game.ColorIdex])
                }
        })
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options(game: TrailGame())
    }
}
