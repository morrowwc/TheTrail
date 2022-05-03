//
//  ViewExt.swift
//  TheTrail
//
//  Created by Will Morrow on 11/15/21.
//

import SwiftUI

extension View {
    func popup<T: View>(
        isPresented: Bool,
        content: T
    ) -> some View {
        return modifier(PopUpModifier(isPresented: isPresented, content: content))
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.linear(duration: 1)
    }
}


