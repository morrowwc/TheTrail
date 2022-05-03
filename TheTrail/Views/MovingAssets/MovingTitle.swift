//
//  MovingTitle.swift
//  TheTrail
//
//  Created by Will Morrow on 10/11/21.
//

import SwiftUI

struct MovingTitle: View {
    @EnvironmentObject var game: TrailGame
    var title: String

    var body: some View {
        VStack (spacing: 0){
            ZStack {
                HStack {
                    Tree()
                        .frame(height: 80)
                    Spacer()
                    
                    Tree()
                        .frame(height: 80)
                }
                Text(title)
                    .font(.system(size: UIScreen.main.bounds.width/CGFloat(title.count)*1.1))
                    .fontWeight(.bold)
                    .foregroundColor(game.getColor())
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 10, alignment: .center)
                .foregroundColor(game.getColor())
        }
        
    }
}

struct MovingTitle_Previews: PreviewProvider {
    static var previews: some View {
        MovingTitle(title: "Acheivements")
    }
}
