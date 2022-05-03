//
//  Action.swift
//  TheTrail
//
//  Created by Will Morrow on 2/14/22.
//

import SwiftUI

struct Action: View {
    @EnvironmentObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode
    @State var huntSetUp = false

    var body: some View {
            ZStack{
                //Background
                game.getBGColor()
                    .ignoresSafeArea()
                //View
                
                VStack{
                    MovingTitle(title: "Action")
                    Button(action: {huntSetUp = true}){
                        MiscButton(text: "Hunt", width: 0.95, height: 0.25)
                    }
                    MiscButton(text: "Scavenge", width: 0.95, height: 0.25)
                    MiscButton(text: "Fish", width: 0.95, height: 0.25)
                    MiscButton(text: "Rest", width: 0.95, height: 0.25)
                }
            }
        //.ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        //.navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(game.getColor())
                    Text("Back")
                        .foregroundColor(game.getColor())
                }
            })
        .popup(isPresented: huntSetUp, content: HuntSetUp(isPresented: $huntSetUp, children: $game.savedGames[game.sgIndex].family))
    }
}

struct Action_Previews: PreviewProvider {
    static var previews: some View {
        Action()
            .environmentObject(TrailGame())
    }
}
