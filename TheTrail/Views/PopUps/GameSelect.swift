//
//  NewGameSelect.swift
//  TheTrail
//
//  Created by Will Morrow on 1/28/22.
//

import SwiftUI

struct GameSelect: View {
    @EnvironmentObject var game: TrailGame
    @Binding var isPresented: Bool
    var isNew: Bool

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
            Button(action:{isPresented.toggle()}) {
                Image("X")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.width*0.1)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.75, alignment: .topTrailing)
            VStack{
                if isNew{
                    Text("New Game")
                        .font(.system(size: UIScreen.main.bounds.width/(10.0*1.1)))
                }
                else{
                    Text("Continue")
                        .font(.system(size: UIScreen.main.bounds.width/(10.0*1.1)))
                }
                ForEach(0...2, id: \.self){index in
                    if game.savedGames[index].distance == 2000{
                        NavigationLink(destination: GameUI(index: index)){
                            SavedGameButton(index: 4, isNew: isNew)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if isNew{
                                game.savedGames[index] = SavedGame()
                            }
                        })
                    }
                    else{
                        NavigationLink(destination: GameUI(index: index)) {
                            SavedGameButton(index: index, isNew: isNew)
                        }.simultaneousGesture(TapGesture().onEnded{
                            if isNew{
                                game.savedGames[index] = SavedGame()
                            }
                        })
                    }
                }
            }
        }
        .foregroundColor(game.getColor())
    }
}

struct GameSelect_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }
    struct Preview: View {
        @State var isPresented = true
        var body: some View {
            Color.clear
                .popup(isPresented: isPresented, content: GameSelect(isPresented: $isPresented, isNew: true))
                .environmentObject(TrailGame())
        }
    }
}
