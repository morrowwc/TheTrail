//
//  Options.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct Options: View {
    @EnvironmentObject var game: TrailGame

    @Environment (\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            //Background
            game.getBGColor()
                .ignoresSafeArea()
            //View
            VStack{
                MovingTitle(title: "Options")
                ScrollView{
                    Button(action:{ game.sounds.toggle() }) {
                        BoolButton(text: "Sounds", on: $game.sounds, width: 0.95, height: 0.3)
                    }
                    Button(action:{ game.notifications.toggle() }) {
                        BoolButton(text: "Notifications", on: $game.notifications, width: 0.95, height: 0.3)
                    }
                    ScrollButton(title: "Color"){ScrollColor(currentPage: $game.ColorIndex)}
                    ScrollButton(title: "Background"){ScrollColor(currentPage: $game.BGColorIndex)}
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: {
                    game.save()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(game.getColor())
                        Text("Home")
                            .foregroundColor(game.getColor())
                    }
            })
        }
    }
}

struct Options_Previews: PreviewProvider {
    static var previews: some View {
        Options()
            .environmentObject(TrailGame())
    }
}
