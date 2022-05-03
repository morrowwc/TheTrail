//
//  AchievementGet.swift
//  TheTrail
//
//  Created by Will Morrow on 11/13/21.
//

import SwiftUI

struct GetAchievement: View{
    @EnvironmentObject var game: TrailGame
    var achvnum: Int
    @Binding var isPresented: Bool

    func getColor() -> Color {
        if achvnum == 0 && game.ColorIndex == game.BGColorIndex{
            return game.GameColors[1]
        }
        else if achvnum == 1 && game.ColorIndex == game.BGColorIndex{
            return game.GameColors[0]
        }
        else{
            return game.getColor()
        }
    }

    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color.black)
                .opacity(0.5)
            Rectangle()
                .fill(game.getBGColor())
                .border(getColor(), width: 8.0)
                .frame(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.width*0.75)
            VStack{
                Text("Achievement Unlocked!")
                Text(game.achievements[achvnum].name)
                    .font(.system(size: UIScreen.main.bounds.width/CGFloat(game.achievements[achvnum].name.count)*1.2))
                    .fontWeight(.bold)
                //Text(isPresented.description)

                
            }
            Button(action:{
                isPresented.toggle()
                game.achievements[achvnum].beenPresented.toggle()
            }) {
                Image("X")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.width*0.1)
                    .padding()
            }
            .frame(width: UIScreen.main.bounds.width*0.75, height: UIScreen.main.bounds.width*0.75, alignment: .topTrailing)
        }
        .foregroundColor(getColor())
    }
}
//binding preview / popup preview
struct GetAchievement_Previews: PreviewProvider {

    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }
    struct Preview: View {
        @State var isPresented = true
        var body: some View {
            Color.clear
                .popup(isPresented: isPresented, content: GetAchievement(achvnum: 0, isPresented: $isPresented))
                .environmentObject(TrailGame())
        }
    }
}

