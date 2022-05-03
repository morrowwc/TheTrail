//
//  MovingWagon.swift
//  TheTrail
//
//  Created by Will Morrow on 10/11/21.
//

import SwiftUI

struct WagonPhases: View {
    @EnvironmentObject var game: TrailGame
    @State var phase = 0;
    @Binding var isMoving: Bool
    var speed: Double
    
    var body: some View {
        VStack{
            Group{ //moving cart
                if phase == 0{
                    WagonFrame(picture: "MovingWagon0")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.isOver()){phase = 25}
                                else if(game.screenIsMoving()){phase += 1; isMoving = true}
                                else{phase = 4}
                            }
                        }
                }

                if phase == 1 {
                    WagonFrame(picture: "MovingWagon1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.isOver()){phase = 25}
                                else if(game.screenIsMoving()){phase += 1}
                                else{phase = 4}
                            }
                        }
                }
                if phase == 2 {
                    WagonFrame(picture: "MovingWagon2")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.isOver()){phase = 25}
                                else if(game.screenIsMoving()){phase += 1}
                                else{phase = 4}
                            }
                        }
                }
                if phase == 3 {
                    WagonFrame(picture: "MovingWagon3")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.isOver()){phase = 25}
                                else if(game.screenIsMoving()){phase = 0}
                                else{phase = 4}
                            }
                        }
                }
            }
            Group{//just chillin idk
                if phase == 4 || phase ==  8 || phase == 12 || phase == 16 {
                    WagonFrame(picture: "stillWagon0")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.screenIsMoving()){
                                    self.phase = 0
                                }
                                else{self.phase += 1}
                            }
                        }
                }
                if phase == 5 || phase == 9 || phase == 13 || phase == 17{
                    WagonFrame(picture: "stillWagon1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.screenIsMoving()){
                                    self.phase = 0
                                }
                                else{self.phase += 1}
                            }
                        }
                }
                if phase == 6 || phase == 10 || phase == 14 || phase == 18 {
                    WagonFrame(picture: "stillWagon0")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.screenIsMoving()){
                                    self.phase = 0
                                }
                                else{self.phase += 1}
                            }
                        }
                }
                if phase == 7 || phase == 11 || phase == 15 || phase == 19{
                    WagonFrame(picture: "stillWagon1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                if(game.screenIsMoving()){
                                    self.phase = 0
                                }
                                else{self.phase += 1}
                            }
                        }
                }
                // eats some grass
                if phase == 20{
                    WagonFrame(picture: "stillWagon2")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 21{
                    WagonFrame(picture: "stillWagon3")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 22{
                    WagonFrame(picture: "stillWagon4")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1

                            }
                        }
                }
                if phase == 23{
                    WagonFrame(picture: "stillWagon2")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 24{
                    WagonFrame(picture: "stillWagon1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase = 4
                            }
                        }
                }
            }
            Group{ // dead
                if phase == 25{
                    WagonFrame(picture: "deadWagon0")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 26{
                    WagonFrame(picture: "deadWagon1")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 27{
                    WagonFrame(picture: "deadWagon2")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase += 1
                            }
                        }
                }
                if phase == 28{
                    WagonFrame(picture: "deadWagon3")
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                                self.phase = 26
                            }
                        }
                }
            }
        }
            .scaledToFit()
            .scaleEffect(0.8)
            .foregroundColor(game.getColor())
            .offset(y: 40)
    }
}

//struct Wagon_Previews: PreviewProvider {
//    static var previews: some View {
//        Wagon(game.screenIsMoving(): false, speed: 1)
//            .environmentObject(TrailGame())
//    }
//}
