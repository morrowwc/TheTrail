//
//  MovingLandscape.swift
//  TheTrail
//
//  Created by Will Morrow on 11/29/21.
//

import SwiftUI

struct MovingLandscape: View {
    @EnvironmentObject var game: TrailGame
    @State var isMoving = true
    @State var treeoffset = 0.4*UIScreen.main.bounds.width
    @State var bushoffset = -0.3*UIScreen.main.bounds.width
    @State var speed = 1.0

    var body: some View {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
            
            if(treeoffset > 0.55*UIScreen.main.bounds.width){
                treeoffset = -0.55*UIScreen.main.bounds.width
            }
            else{
                treeoffset += speed
            }
            if(bushoffset > 0.55*UIScreen.main.bounds.width){
                bushoffset = -0.55*UIScreen.main.bounds.width
            }
            else{
                bushoffset += speed
            }
            if(!game.screenIsMoving()){
                speed = 10
                if -0.55*UIScreen.main.bounds.width <= treeoffset && treeoffset <= 0.55*UIScreen.main.bounds.width{
                    isMoving = false
                    speed = 0
                }
            }
            else{
                speed = 1
                isMoving = true
            }
        }
        return ZStack{
            // "on screen"
            HStack {
                Text("Miles Left:")
                Text(String(game.savedGames[game.sgIndex].distance))
                Spacer()
                Text("Food:")
                Text(String(game.savedGames[game.sgIndex].food))
            }
                .foregroundColor(game.getColor())
                .font(.system(size: UIScreen.main.bounds.width/15))
                .padding(25)
                .offset(y:-UIScreen.main.bounds.height/4.6)
            Rectangle()
                .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.height*0.01)
            Tree()
                .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.1)
                .padding(.bottom, UIScreen.main.bounds.height/9.5)
                .offset(x: CGFloat(treeoffset))
            WagonPhases(isMoving: $isMoving, speed: speed)

            Bush()
                .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.1)
                .padding(.top, UIScreen.main.bounds.height/4)
                .offset(x: CGFloat(bushoffset))

            // covers passing trees
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5, alignment: .leading)
                .scaleEffect(x: 0.025, anchor: .leading)
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.5, alignment: .leading)
                .scaleEffect(x: 0.025, anchor: .trailing)
        }
        .foregroundColor(game.getColor())
    }
}

struct MovingLandscape_Previews: PreviewProvider {
    static var previews: some View {
        MovingLandscape()
            .environmentObject(TrailGame())
    }
}
