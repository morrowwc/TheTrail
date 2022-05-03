//
//  TextFieldButton.swift
//  TheTrail
//
//  Created by Will Morrow on 2/2/22.
//

import SwiftUI

struct TextFieldButton: View {
    @EnvironmentObject var game: TrailGame
    var text: String
    @State var textVar: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(game.getBGColor())
                .border(game.getColor(), width: 8.0)
            TextField(text, text: $textVar)
                .font(.system(size: 25))
                .foregroundColor(game.getColor())
                .padding()
        }
        .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.15)

    }
}

//struct TextFieldButton_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldButton(text: "Enter text here")
//    }
//}
