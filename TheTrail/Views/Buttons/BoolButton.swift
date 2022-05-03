//
//  SwiftUIView.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct BoolButton: View{
    @EnvironmentObject var game: TrailGame
    var text: String
    @Binding var on: Bool
    var width: CGFloat
    var height: CGFloat

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .border(game.getColor(), width: 8.0)

            HStack {
                Text(text)
                    .font(.system(size: 25))
                    .foregroundColor(game.getColor())
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(game.getBGColor())
                        .border(game.getColor(), width: 4.0)
                        .frame(width: UIScreen.main.bounds.width*0.5*height, height: UIScreen.main.bounds.width*0.5*height)
                    if(on){
                        Rectangle()
                            .fill(game.getColor())
                            .border(game.getColor(), width: 4.0)
                            .frame(width: UIScreen.main.bounds.width*0.3*height, height: UIScreen.main.bounds.width*0.3*height)
                    }
                }
                
            }
            .frame(width: UIScreen.main.bounds.width*(width-0.1), height: UIScreen.main.bounds.width*height)
        }
        .frame(width: UIScreen.main.bounds.width*width, height: UIScreen.main.bounds.width*height)
    }
}

//struct BoolButton_Previews: PreviewProvider {
//    static var previews: some View {
//        BoolButton(text: "Button", on: true, width: 0.95, height: 0.3)
//            .environmentObject(TrailGame())
//
//    }
//}

