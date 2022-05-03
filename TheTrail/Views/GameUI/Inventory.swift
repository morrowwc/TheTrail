//
//  Inventory.swift
//  TheTrail
//
//  Created by Will Morrow on 2/15/22.
//

import SwiftUI

struct Inventory: View {
    @EnvironmentObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode
    @State var onFamily = true

    var body: some View {
        ZStack{
            //Background
            game.getBGColor()
                .ignoresSafeArea()
            //View
            VStack{
                MovingTitle(title: "Inventory")
                HStack{
                    Button(action: {onFamily = true}){
                        MiscButton(text: "Family", width: 0.475, height: 0.2)

                    }
                    Button(action: {onFamily = false}){
                        MiscButton(text: "Items", width: 0.475, height: 0.2)
                    }
                }
                if onFamily{
                    ScrollView{
                        ForEach(game.savedGame().family, id: \.self){ member in
                            CharacterStats(char: member)
                        }
                    }
                }
                else{
                    ScrollView{
                        ForEach(game.savedGame().items, id: \.self){ item in
                            ItemDisplay(item: item)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
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
    }
}

struct Inventory_Previews: PreviewProvider {
    static var previews: some View {
        Inventory()
    }
}
