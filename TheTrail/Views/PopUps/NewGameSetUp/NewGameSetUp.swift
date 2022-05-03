//
//  NewGameSetUp.swift
//  TheTrail
//
//  Created by Will Morrow on 2/2/22.
//

import SwiftUI

struct NewGameSetUp: View {
    @EnvironmentObject var game: TrailGame
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.black)
                .opacity(0.5)
            Rectangle()
                .fill(game.getBGColor())
                .border(game.getColor(), width: 8.0)
                .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.75)
            VStack{
                Text("Game Set-Up")
                    .font(.system(size: UIScreen.main.bounds.width/11))
                FamilyScrollView(family: $game.savedGames[game.sgIndex].family,
                                 length: game.savedGames[game.sgIndex].family.count - 1)
                Button(action:{
                    isPresented.toggle()
                }) {
                    ZStack{
                        Rectangle()
                            .fill(game.getBGColor())
                            .border(game.getColor(), width: 8.0)
                        Text("Done")
                            .font(.system(size: UIScreen.main.bounds.width/12))

                    }
                    .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.1)
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.7)

            
        }
        .foregroundColor(game.getColor())
    }
}

struct NewGameSetUp_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }
    struct Preview: View {
        @State var isPresented = true
        var body: some View {
            Color.clear
                .popup(isPresented: isPresented, content:         NewGameSetUp(isPresented: $isPresented))
                .environmentObject(TrailGame())
        }
    }
}
