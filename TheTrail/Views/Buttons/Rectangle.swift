//
//  Button.swift
//  TheTrail
//
//  Created by Will Morrow on 9/14/21.
//

import SwiftUI

struct Rectangle: View {
    @ObservedObject var game: TrailGame
    var body: some View {
        GeometryReader{ geometry in
            Path{ path in
                let width = min(geometry.size.width, geometry.size.height)
                let top = 0.0*width
                let bottom = 0.3*width
                let left = 0.0*width
                let right = width
                let middle = right/2
                let gap = 0.02*width
                
                path.addLines([
                    CGPoint(x: left, y: top),
                    CGPoint(x: left, y: bottom),
                    CGPoint(x: middle, y: bottom),
                    CGPoint(x: middle, y: bottom - gap),
                    CGPoint(x: left + gap, y: bottom - gap),
                    CGPoint(x: left + gap, y: top + gap),
                    CGPoint(x: right - gap, y: top + gap),
                    CGPoint(x: right - gap, y: bottom - gap),
                    CGPoint(x: middle, y: bottom - gap),
                    CGPoint(x: middle, y: bottom),
                    
                    
                    CGPoint(x: right, y: bottom),
                    CGPoint(x: right, y: top),
                    CGPoint(x: left, y: top)
                ])
            }
            .fill(game.GameColors[game.ColorIdex])
        }
    }
}

struct Rectangle_Previews: PreviewProvider {
    static var previews: some View {
        Rectangle(game: TrailGame())
    }
}
