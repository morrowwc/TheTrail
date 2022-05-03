//
//  Tree.swift
//  TheTrail
//
//  Created by Will Morrow on 10/11/21.
//

import SwiftUI

struct Tree: View {
    @EnvironmentObject var game: TrailGame
    @State var phase = 0;
    var body: some View {
        VStack{
            if phase == 0 {
                Image("Tree0")
                    .resizable()
                    .renderingMode(.template)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.phase = 1
                        }
                    }
                    //.transition(.move(edge: .top))      // uncomment to modify transition
            }

            if phase == 1 {
                Image("Tree1")
                    .resizable()
                    .renderingMode(.template)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.phase = 2
                        }
                    }
            }
            if phase == 2 {
                Image("Tree2")
                    .resizable()
                    .renderingMode(.template)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.phase = 3
                        }
                    }
            }
            if phase == 3 {
                Image("Tree3")
                    .resizable()
                    .renderingMode(.template)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.phase = 0
                        }
                    }
            }
        }
        .scaledToFit()
        .foregroundColor(game.getColor())

    }
}

struct Tree_Previews: PreviewProvider {
    static var previews: some View {
        Tree()
            .environmentObject(TrailGame())
    }
}
