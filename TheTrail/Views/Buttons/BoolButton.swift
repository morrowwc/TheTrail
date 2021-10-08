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
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width*0.3)
                .border(game.GameColors[game.ColorIdex], width: 8.0)
            HStack {
                Text(text)
                    .font(.system(size: 25))
                    .foregroundColor(game.GameColors[game.ColorIdex])
                Spacer()
                if(on){
                    Text("ON")
                        .font(.system(size: 25))
                        .foregroundColor(game.GameColors[game.ColorIdex])
                }
                else{
                    Text("OFF")
                        .font(.system(size: 25))
                        .foregroundColor(game.GameColors[game.ColorIdex])
                }
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        
        //.padding(.horizontal)
        
    }
}

struct BoolButton_Previews: PreviewProvider {
    static var previews: some View {
        BoolButton(game: TrailGame(), text: "Button", on: true)
    }
}

