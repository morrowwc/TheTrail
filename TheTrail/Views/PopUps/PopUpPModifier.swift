//
//  PopUpWindow.swift
//  TheTrail
//
//  Created by Will Morrow on 10/6/21.
//

import SwiftUI

struct PopUpModifier<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool

    // 1.
    init(isPresented: Bool, content: T) {
        self.isPresented = isPresented
        popup = content
    }

    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .transition(.move(edge: .leading))
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        }
    }
}

