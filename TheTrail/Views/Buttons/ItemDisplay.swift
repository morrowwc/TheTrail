//
//  ItemDisplay.swift
//  TheTrail
//
//  Created by Will Morrow on 2/16/22.
//

import SwiftUI

struct ItemDisplay: View {
    var item: Item
    @EnvironmentObject var game: TrailGame

    var body: some View {
        ZStack(alignment: .center){
            Rectangle()
                .fill(game.getBGColor())
                .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.width*0.3)
                .border(game.getColor(), width: 8.0)
            HStack{
                Text(item.name)
                    .font(.system(size: 25))
                    .foregroundColor(game.getColor())
                Spacer()
                Image(item.getIcon())
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(game.getColor())
                    .frame(width: UIScreen.main.bounds.width*0.25, height: UIScreen.main.bounds.height*0.14)
                Text(item.getDisplay())
                    .font(.system(size: 25))
                    .foregroundColor(game.getColor())
            }
            .padding(.horizontal, 30)
        }
        
    }
}

struct ItemDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ItemDisplay(item: Weapon(name: "Pistol", value: 1.0))
            .environmentObject(TrailGame())
    }
}
