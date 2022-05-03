//
//  GameUI.swift
//  TheTrail
//
//  Created by Will Morrow on 10/7/21.
//

import SwiftUI

struct GameUI: View {
    @EnvironmentObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode
    @State var _travelbutton = "Travel"
    var index: Int
    
    func travelButton(){
        if game.screenIsMoving(){_travelbutton = "Stop"}
        else{_travelbutton = "Travel"}
    }
    
    var body: some View {
        ZStack {
            //Background
            game.getBGColor()
                .ignoresSafeArea()
            //View
            VStack{
                GameImage()
                Button(action: {game.moveButton(); travelButton()}){
                    MiscButtonBT(text: $_travelbutton, width: 0.95, height: 0.2)
                }
                NavigationLink(destination: Action()) {
                    MiscButton(text: "Action", width: 0.95, height: 0.2)
                }
                NavigationLink(destination: Inventory()) {
                    MiscButton(text: "Inventory", width: 0.95, height: 0.2)
                }
            }
            .disabled(game.savedGames[game.sgIndex].notSetUp)
        }
        .onAppear(perform: {game.sgIndex = index})
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
            Button(action: {
                if game.savedGames[game.sgIndex].distance == 2000{
                    game.savedGames[game.sgIndex].notSetUp = true
                }
                game.save()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .foregroundColor(game.getColor())
                    Text("Save and Exit")
                        .foregroundColor(game.getColor())
                }
            })
        .popup(isPresented: game.savedGames[game.sgIndex].notSetUp, content: NewGameSetUp( isPresented: $game.savedGames[game.sgIndex].notSetUp))
    }
}

//struct GameUI_Previews: PreviewProvider {
//    static var previews: some View {
//        GameUI()
//            .environmentObject(TrailGame())
//            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//
//    }
//}
