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
            PageViewController(pages: game.GameColorText, currentPage: $currentPage, game: game)
            Text(String(currentPage))
        }

    }
}

struct ScrollText_Previews: PreviewProvider {
    static var previews: some View {
        ScrollText(game: TrailGame())
    }
}
