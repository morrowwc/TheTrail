//
//  FamilyScrollView.swift
//  TheTrail
//
//  Created by Will Morrow on 2/5/22.
//

import SwiftUI

struct FamilyScrollView: View {
    @EnvironmentObject var game: TrailGame
    @Binding var family: [Person]
    @State var length: Int
    
    var body: some View {
        ScrollView{
            VStack{
                EditableList($family){$member in
                    ZStack{
                        Rectangle()
                            .fill(game.getBGColor())
                            .border(game.getColor(), width: 8.0)
                        
                        TextField(member.name, text: $member.name)
                            .font(.system(size: UIScreen.main.bounds.width/12))
                            .foregroundColor(game.getColor())
                            .padding()
                        if member != family[0] {
                            Button(action: {length -= 1; family = family.filter { $0 !== member }}){
                                Image("X")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: UIScreen.main.bounds.width*0.05, height:
                                           UIScreen.main.bounds.width*0.05)
                                    .padding()
                            }
                            .frame(width: UIScreen.main.bounds.width*0.7, height:
                                   UIScreen.main.bounds.height*0.1, alignment: .topTrailing)
                        }
                        
                    }
                }
                Button(action:{
                    game.addFamilyMember(name: "Child Name")
                    length += 1
                }){
                    ZStack{
                        Rectangle()
                            .fill(game.getBGColor())
                            .border(game.getColor(), width: 8.0)
                        Text("Add Child")
                            .font(.system(size: UIScreen.main.bounds.width/12))
                    }
                    .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.1)
                }
            }
        }
    }
}

//struct FamilyMember: View{
//    var game: TrailGame // just reference
//    var index: Int
//
//    var body: some View{
//        ZStack{
//            Rectangle()
//                .fill(game.getBGColor())
//                .border(game.getColor(), width: 8.0)
//            TextField(family[index].name, text: $family[index].name)
//                .font(.system(size: UIScreen.main.bounds.width/12))
//                .foregroundColor(game.getColor())
//                .padding()
//            if index != 0 {
//                Button(action: {family.remove(at: index)}){
//                    Image("X")
//                        .resizable()
//                        .renderingMode(.template)
//                        .frame(width: UIScreen.main.bounds.width*0.05, height:
//                               UIScreen.main.bounds.width*0.05)
//                        .padding()
//                }
//                .frame(width: UIScreen.main.bounds.width*0.7, height:
//                       UIScreen.main.bounds.height*0.1, alignment: .topTrailing)
//            }
//        }
//    }
//}

//struct FamilyScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        FamilyScrollView()
//    }
//}
