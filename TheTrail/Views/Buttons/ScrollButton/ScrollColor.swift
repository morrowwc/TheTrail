//
//  ScrollText.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollColor: View {
    @Binding var currentPage: Int
    @EnvironmentObject var game: TrailGame
    
    var body: some View {
        ZStack {
            //View
            
            PageViewController(pages:
            [
                Text(game.GameColors[0].description.capitalized)
                    .foregroundColor(game.GameColors[0])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[1]),
                Text(game.GameColors[1].description.capitalized)
                    .foregroundColor(game.GameColors[1])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[0]),
                Text(game.GameColors[2].description.capitalized)
                    .foregroundColor(game.GameColors[2])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[1]),
                Text(game.GameColors[3].description.capitalized)
                    .foregroundColor(game.GameColors[3])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[0]),
                Text(game.GameColors[4].description.capitalized)
                    .foregroundColor(game.GameColors[4])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[1]),
                Text(game.GameColors[5].description.capitalized)
                    .foregroundColor(game.GameColors[5])
                    .font(.system(size: 25))
                    .frame(width: 80, height: 30)
                    .background(game.GameColors[0])//,
                //Text(game.GameColors[6].description.capitalized)
                //    .foregroundColor(game.GameColors[6])
                //    .font(.system(size: 25))
                //    .frame(width: 80, height: 30)
                //    .background(game.GameColors[1]),
                //Text(game.GameColors[7].description.capitalized)
                //    .foregroundColor(game.GameColors[7])
                //    .font(.system(size: 25))
                //    .frame(width: 80, height: 30)
                //    .background(game.GameColors[0])
                
            ]
                                , currentPage: $currentPage)

        }
        .frame(width: 80, height: 30)
    }
}

struct ScrollColor_Previews: PreviewProvider {
    @State static var value = 0

    static var previews: some View {
        ScrollColor(currentPage: $value)
            .environmentObject(TrailGame())
    }
}
