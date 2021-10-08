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
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.width*0.3)
                .border(game.GameColors[game.ColorIdex], width: 8.0)
            HStack {
                Text(title)
                    .font(.system(size: 25))
                    .foregroundColor(game.GameColors[game.ColorIdex])
                Spacer()
                scrollText
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        //.padding(.horizontal)
    }
}

//  struct ScrollButton_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ScrollButton(title: "Button", game: TrailGame(), scrollText: ScrollColor(currentPage: 0, game: //TrailGame()))
//    }
//}
