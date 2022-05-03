//
//  Achievements.swift
//  TheTrail
//
//  Created by Will Morrow on 9/28/21.
//  

import SwiftUI

struct Achievements: View {
    @EnvironmentObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            //Background
            game.getBGColor()
                .ignoresSafeArea()
            //View
            VStack {
                MovingTitle(title: "Achievements")
                ScrollView{
                    ForEach(game.achievements, id: \.name){achv in
                        if(achv.complete){
                            MiscButton(text: achv.name, width: 0.95, height: 0.3)
                            
                        }
                    }
                    ForEach(game.achievements, id: \.name){achv in
                        if(!achv.complete){
                            MiscButton(text: "???", width: 0.95, height: 0.3)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                Button(action: { self.presentationMode.wrappedValue.dismiss()
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

struct Achievements_Previews: PreviewProvider {
    static var previews: some View {
        Achievements()
            .environmentObject(TrailGame())
    }
}
