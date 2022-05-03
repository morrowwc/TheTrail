//
//  WagonFrame.swift
//  TheTrail
//
//  Created by Will Morrow on 2/7/22.
//

import SwiftUI

struct WagonFrame: View {
    @EnvironmentObject var game: TrailGame
    var picture: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(game.getBGColor())
                .scaleEffect(x: 0.33, y: 0.3)
                .offset(x: UIScreen.main.bounds.width*0.22, y: -UIScreen.main.bounds.width*0.1)
            Image(picture)
                .resizable()
                .renderingMode(.template)
        }
    }
}

//struct WagonFrame_Previews: PreviewProvider {
//    static var previews: some View {
//        WagonFrame()
//    }
//}
