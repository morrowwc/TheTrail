//
//  TitleScreen.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct TitleScreen: View {
    var gameColor = Color(red: 0.0, green: 0.0, blue: 1.0)
    var body: some View {
        VStack {
            Text("The Trail")
                .font(.largeTitle)
                .foregroundColor(gameColor)
            RecButton(boxColor: gameColor, text: "Play")
            RecButton(boxColor: gameColor, text: "Play")
            RecButton(boxColor: gameColor, text: "Play")
            RecButton(boxColor: gameColor, text: "Play")
        }
    }
}

struct TitleScreen_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreen()
    }
}
