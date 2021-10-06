//
//  PopUpWindow.swift
//  TheTrail
//
//  Created by Will Morrow on 10/6/21.
//

import SwiftUI

struct PopUpWindow: View {
    @ObservedObject var game: TrailGame

    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .opacity(0.5)
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.width*0.75)
                .border(game.GameColors[game.ColorIdex], width: 8.0)

        }
    }
}

struct PopUpWindow_Previews: PreviewProvider {
    static var previews: some View {
        PopUpWindow(game: TrailGame())
    }
}
