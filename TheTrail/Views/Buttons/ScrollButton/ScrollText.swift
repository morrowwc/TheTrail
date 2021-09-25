//
//  ScrollText.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollText: View {
    @State private var currentPage = 0
    @ObservedObject var game: TrailGame

    var body: some View {
        VStack {
            PageViewController(
                pages: [
                    Text("Blue").foregroundColor(game.GameColors[0]),
                    Text("Green").foregroundColor(game.GameColors[1]),
                    Text("Red").foregroundColor(game.GameColors[2])
                ],
                currentPage: $currentPage, game: game)
                .frame(width: 80, height: 80)
        }
    }
}

struct ScrollText_Previews: PreviewProvider {
    static var previews: some View {
        ScrollText(game: TrailGame())
    }
}
