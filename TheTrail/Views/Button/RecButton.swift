//
//  RecButton.swift
//  TheTrail
//
//  Created by Will Morrow on 9/15/21.
//

import SwiftUI

struct RecButton: View {
    var boxColor: Color
    var text: String
    var body: some View {
        ZStack{
            Rectangle(boxColor: boxColor)
            Text(text)
                .foregroundColor(boxColor)
        }
    }
}

struct RecButton_Previews: PreviewProvider {
    static var previews: some View {
        RecButton(boxColor: Color(red: 0.0, green: 0.0, blue: 1.0), text: "Button")
    }
}
