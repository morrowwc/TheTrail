//
//  Achievements.swift
//  TheTrail
//
//  Created by Will Morrow on 9/28/21.
//

import SwiftUI

struct Achievements: View {
    @ObservedObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Achievements")
                .font(.largeTitle)
                .foregroundColor(game.GameColors[game.ColorIdex])
            ScrollView{
                ForEach(game.achievments, id: \.name){achv in
                    if(achv.complete){
                        MiscButton(text: achv.name, game: game)
                        
                    }
                }
                ForEach(game.achievments, id: \.name){achv in
                    if(!achv.complete){
                        MiscButton(text: "???", game: game)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
            Button(action: { self.presentationMode.wrappedValue.dismiss()
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

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements(game: TrailGame())
    }
}
