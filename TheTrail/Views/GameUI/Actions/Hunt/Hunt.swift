//
//  Hunt.swift
//  TheTrail
//
//  Created by Will Morrow on 2/17/22.
//

import SwiftUI

struct Hunt: View {
    @EnvironmentObject var game: TrailGame
    @Environment (\.presentationMode) var presentationMode
    @ObservedObject var hunt: HuntGame
    @State var animalIndex = 0
    @State var firstAppear: Bool = true


    var body: some View {
        print(hunt.animals[animalIndex].offsetX)
        return
        ZStack{
            //Background
            game.getBGColor()
                .ignoresSafeArea()
            
            VStack{
                HStack{
                    Spacer()
                    Text("Ammo: " + String(hunt.ammo))
                        .foregroundColor(game.getColor())
                        .font(.system(size: UIScreen.main.bounds.width/15))
                        .padding(.top, 60)
                        .padding(.horizontal, 10)
                }
                Spacer()
                Spacer()
                Image("HSBush")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(game.getColor())
                Spacer()
            }
            
            //forest overlay
            VStack(){
                Image("HSTop")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(game.getColor())
                Spacer()
                Image("HSBottom")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .foregroundColor(game.getColor())
            }
            MovingAnimal(animal: hunt.animals[animalIndex], ammo: $hunt.ammo, animalCount: hunt.animals.count)
        }
        .onAppear(){
            print("appeared")
            for index in 1...(hunt.animals.count -  1){
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0*Double((index))){
                    print(hunt.animals.count)
                    if index == hunt.animals.count - 1{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                            
                        }
                        //self.presentationMode.wrappedValue.dismiss()
                    }
                    animalIndex += 1
                    hunt.animals[animalIndex].move()
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        
    }
}

struct Hunt_Previews: PreviewProvider {
    static var previews: some View {
        Hunt(hunt: HuntGame())
            .environmentObject(TrailGame())
    }
}
