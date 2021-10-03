//
//  ContentView.swift
//  TheTrail
//
//  Created by Will Morrow on 9/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TitleScreen()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPod gen 7"))
            .previewDisplayName("iPod 7")
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
        
    }
}
