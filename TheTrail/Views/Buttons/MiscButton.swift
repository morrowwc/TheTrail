//
//  RecButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct MiscButton: View {
    var text: String
    var width: CGFloat
    var height: CGFloat
    @EnvironmentObject var game: TrailGame

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width*width, height: UIScreen.main.bounds.width*height)
                .border(game.getColor(), width: 8.0)
            Text(text)
                .font(.system(size: 25))
                .foregroundColor(game.getColor())
        }
    }
}

struct MiscButton_Previews: PreviewProvider {
    static var previews: some View {
        MiscButton(text: "Button", width: 0.95, height: 0.3)
            .environmentObject(TrailGame())

    }
}

//binding title
struct MiscButtonBT: View {
    @Binding var text: String
    var width: CGFloat
    var height: CGFloat
    @EnvironmentObject var game: TrailGame

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width*width, height: UIScreen.main.bounds.width*height)
                .border(game.getColor(), width: 8.0)
            Text(text)
                .font(.system(size: 25))
                .foregroundColor(game.getColor())
        }
    }
}

//struct MiscButtonBT_Previews: PreviewProvider {
//    static var previews: some View {
//        MiscButton(text: s)
//            .environmentObject(TrailGame())
//
//    }
//}

