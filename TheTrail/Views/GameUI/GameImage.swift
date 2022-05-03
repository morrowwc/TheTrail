//
//  GameImage.swift
//  TheTrail
//
//  Created by Will Morrow on 11/29/21.
//

import SwiftUI

struct GameImage: View {
    @EnvironmentObject var game: TrailGame
    
    var body: some View {
        return
            ZStack{
                Rectangle()
                    .fill(game.getBGColor())
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5)
                    .border(game.getColor(), width: 8.0)
                    .scaleEffect(x: 0.95, anchor: .center)
                MovingLandscape()
            }
    }
}

//struct GameImage_Previews: PreviewProvider {
//    static var previews: some View {
//        GameImage()
//            .environmentObject(TrailGame())
//    }
//}
