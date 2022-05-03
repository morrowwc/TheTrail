//
//  Bush.swift
//  TheTrail
//
//  Created by Will Morrow on 12/1/21.
//

import SwiftUI

struct Bush: View {
    @EnvironmentObject var game: TrailGame

    var body: some View {
        Image("bush")
            .resizable()
            .renderingMode(.template)
            .scaledToFit()
            .foregroundColor(game.getColor())
    }
}

struct Bush_Previews: PreviewProvider {
    static var previews: some View {
        Bush()
            .environmentObject(TrailGame())
    }
}
