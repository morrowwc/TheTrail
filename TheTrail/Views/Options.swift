//
//  Options.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct Options: View {
    @ObservedObject var game: TrailGame
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Options")
                .font(.largeTitle)
                .foregroundColor(game.GameColors[game.ColorIdex])
            ScrollView{
                BoolButton(game: game, text: "Sound")
                BoolButton(game: game, text: "Notifications")
                BoolButton(game: game, text: "Color")
                ScrollButton(title: "Color", game: game)
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
