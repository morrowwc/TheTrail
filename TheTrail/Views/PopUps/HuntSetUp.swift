//
//  HuntSetUp.swift
//  TheTrail
//
//  Created by Will Morrow on 4/4/22.
//

import SwiftUI

struct HuntSetUp: View {
    @EnvironmentObject var game: TrailGame
    @Binding var isPresented: Bool
    @Binding var children: [Person]
    //@State var takenList = [Bool]()
    @State var childrenTaken = [Person]()
    
    var body: some View {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(Color.black)
                    .opacity(0.5)
                Rectangle()
                    .fill(game.getBGColor())
                    .border(game.getColor(), width: 8.0)
                    .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.75)
                Button(action:{isPresented.toggle()}) {
                    Image("X")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: UIScreen.main.bounds.width*0.1, height: UIScreen.main.bounds.width*0.1)
                        .padding()
                }
                .frame(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.75, alignment: .topTrailing)
                VStack{
                    Text("Hunt")
                        .font(.system(size: UIScreen.main.bounds.width/(10.0*0.9)))
                    HStack{
                        Text("Children")
                            .font(.system(size: UIScreen.main.bounds.width/(10.0*1.1)))
                        Spacer()
                        Text("Taken")
                            .font(.system(size: UIScreen.main.bounds.width/(10.0*1.1)))
                    }
                    .offset(y:10)
                    Rectangle()
                        .fill(game.getColor())
                        .border(game.getColor(), width: 8.0)
                        .frame(width: UIScreen.main.bounds.width*0.8, height: 5)
                    ScrollView{
                        VStack{
                            EditableList($children){ $child in
                                Group{
                                    if child != game.savedGames[game.sgIndex].family[0] {
                                        Button(action: {
                                            if child.isTaken{
                                                childrenTaken.remove(at: childrenTaken.firstIndex(of: child) ?? 0)
                                                child.isTaken = false
                                            }
                                            else{
                                                childrenTaken.append(child)
                                                child.isTaken = true
                                            }
                                        }){
                                            BoolButton(text: child.name, on: $child.isTaken, width: 0.7, height: 0.25)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    NavigationLink(destination: Hunt(hunt: HuntGame(ammo: game.savedGames[game.sgIndex].getAmmo(), childrenTaken: childrenTaken))){
                        MiscButton(text: "Go!", width: 0.7, height: 0.2)
                    }
                }
                .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height*0.7)
            }
            .foregroundColor(game.getColor())
        
    }
}

struct HuntSetUp_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
            .previewDevice("iPod touch")
    }
    struct Preview: View {
        @State var isPresented = true
        @State var children = [Person(name: "Will"), Person(name: "Jimmy"),
                               Person(name: "Sara")]
        var body: some View {
            Color.clear
                .popup(isPresented: isPresented, content: HuntSetUp(isPresented: $isPresented, children: $children))
                .environmentObject(TrailGame())
        }
    }
}
