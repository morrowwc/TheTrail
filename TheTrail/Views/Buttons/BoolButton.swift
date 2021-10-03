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
        ZStack(alignment: .center){
            Rectangle(game: game)
                .scaledToFit()
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, -(UIScreen.main.bounds.size.height)*0.355)
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
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        //.frame(width: 320, height: 100)
    }
}

struct BoolButton_Previews: PreviewProvider {
    static var previews: some View {
        BoolButton(game: TrailGame(), text: "Button", on: true)
    }
}

