//
//  ScrollButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/16/21.
//

import SwiftUI

struct ScrollButton<Content : View>: View {
    var title: String
    @EnvironmentObject var game: TrailGame
    @ViewBuilder var scrollText: Content

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.3)
                .border(game.getColor(), width: 8.0)
                .scaleEffect(x: 0.95, anchor: .center)
            HStack {
                Text(title)
                    .font(.system(size: 25))
                    .foregroundColor(game.getColor())
                Spacer()
                scrollText
            }
            .padding(.leading, 50)
            .padding(.trailing, 50)
        }
        //.padding(.horizontal)
    }
}

//struct ScrollButton_Previews: PreviewProvider {
//    @State static var value = 0
//
//    static var previews: some View {
//        ScrollButton(title: "Button", scrollText: //ScrollColor(currentPage: $value))
//            .environmentObject(TrailGame())
//    }
//}
