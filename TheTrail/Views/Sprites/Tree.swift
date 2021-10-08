//
//  Tree.swift
//  TheTrail
//
//  Created by Will Morrow on 10/7/21.
//

import SwiftUI

struct Tree: View {
    @ObservedObject var game: TrailGame

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = min(geometry.size.width, geometry.size.height)
                let height = width * 0.7
                let spacing = width * 0.030
                let trunkWidth = width * 0.04
                let middle = width * 0.5
                let topWidth = width * 0.27
                let topHeight = height * 0.47
                

                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: topWidth, y: topHeight),
                    //CGPoint(x: middle - topWidth/4, y: topHeight * 2 / 3),
                    CGPoint(x: middle - trunkWidth, y: topHeight - spacing),
                    CGPoint(x: topWidth, y: height * 0.8),
                    CGPoint(x: middle - trunkWidth, y: height * 0.8 - spacing),
                    
                    CGPoint(x: middle - trunkWidth, y: height - spacing),
                    CGPoint(x: middle + trunkWidth, y: height - spacing),
                    
                    CGPoint(x: middle + trunkWidth, y: height * 0.8 - spacing),
                    CGPoint(x: width - topWidth, y: height * 0.8),

                    
                    CGPoint(x: middle + trunkWidth, y: topHeight - spacing),
                    CGPoint(x: width - topWidth, y: topHeight),
                    CGPoint(x: middle, y: spacing)
                ])
                
            }
            .fill(game.GameColors[game.ColorIdex])
        }
    }
}

struct Tree_Previews: PreviewProvider {
    static var previews: some View {
        Tree(game: TrailGame())
    }
}
