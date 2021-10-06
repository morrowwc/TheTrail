//
//  RecButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct MiscButton: View {
    var text: String
    @ObservedObject var game: TrailGame

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width*0.3)
                .border(game.GameColors[game.ColorIdex], width: 8.0)
            Text(text)
                .font(.system(size: 40))
                .foregroundColor(game.GameColors[game.ColorIdex])
        }
        //.padding(.horizontal)
        
    }
}

struct MiscButton_Previews: PreviewProvider {
    static var previews: some View {
        MiscButton(text: "Button", game: TrailGame())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 pm")
        MiscButton(text: "Button", game: TrailGame())
    }
}
