//
//  ScrollText.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollColor: View {
    @State var currentPage: Int
    @ObservedObject var game: TrailGame

    var body: some View {
        VStack {
            PageViewController(
                pages: [
                    Text("Blue").foregroundColor(game.GameColors[0]).font(.system(size: 30)),
                    Text("Green").foregroundColor(game.GameColors[1]).font(.system(size: 30)),
                    Text("Red").foregroundColor(game.GameColors[2]).font(.system(size: 30))
                ],
                currentPage: $currentPage,
                game: game)
                .frame(width: 80, height: 40)
        }
    }
}

//struct ScrollColor_Previews: PreviewProvider {
//    var game = TrailGame()
//    static var previews: some View {
//        ScrollColor(currentPage: game.ColorIdex, game: game)
//    }
//}
