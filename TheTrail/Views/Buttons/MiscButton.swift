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
            Rectangle(game: game)
                .scaledToFit()
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, -(UIScreen.main.bounds.size.height))
            Text(text)
                .foregroundColor(game.GameColors[game.ColorIdex])
        }
    }
}

struct MiscButton_Previews: PreviewProvider {
    static var previews: some View {
        MiscButton(text: "Button", game: TrailGame())
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 pm")
    }
}
