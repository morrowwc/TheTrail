//
//  SwiftUIView.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct BoolButton: View {
    @ObservedObject var game: TrailGame
    var text: String
    var on: Bool

    var body: some View {
        ZStack{
            Rectangle(game: game)
            HStack {
                Text(text)
                    .foregroundColor(game.GameColors[game.ColorIdex])
                Spacer()
                if(on){
                    Text("ON")
                        .foregroundColor(game.GameColors[game.ColorIdex])
                }
                else{
                    Text("OFF")
                        .foregroundColor(game.GameColors[game.ColorIdex])
                }
            }
            .frame(width: 250, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct BoolButton_Previews: PreviewProvider {
    static var previews: some View {
        BoolButton(game: TrailGame(), text: "Button", on: true)
    }
}

