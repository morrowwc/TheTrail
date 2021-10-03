//
//  ScrollButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollButton<Content : View>: View {
    var title: String
    @ObservedObject var game: TrailGame
    @ViewBuilder var scrollText: Content

    var body: some View {
        ZStack(alignment: .center){
            Rectangle(game: game)
                .scaledToFit()
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom, -200)
            HStack {
                Text(title)
                    .foregroundColor(game.GameColors[game.ColorIdex])
                Spacer()
                scrollText
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        
    }
}

//  struct ScrollButton_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ScrollButton(title: "Button", game: TrailGame(), scrollText: ScrollColor(currentPage: 0, game: //TrailGame()))
//    }
//}
