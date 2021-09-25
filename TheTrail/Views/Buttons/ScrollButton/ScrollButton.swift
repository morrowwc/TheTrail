//
//  ScrollButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollButton: View {
    var title: String
    @ObservedObject var game: TrailGame

    var body: some View {
        ZStack{
            HStack {
                Text(title)
                    .foregroundColor(game.GameColors[game.ColorIdex])
                Spacer()
                ScrollText(game: game)
            }
            .frame(width: 250)
            Rectangle(game: game)
        }
    }
}

struct ScrollButton_Previews: PreviewProvider {

    static var previews: some View {
        ScrollButton(title: "Button", game: TrailGame())
    }
}
