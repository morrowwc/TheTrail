//
//  ContentView.swift
//  TheTrail
//
//  Created by Will Morrow on 9/14/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: TrailGame
    
    var body: some View {
            TitleScreen()
    }
    init() {
        UINavigationBar.appearance()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //ContentView()
        //    .previewDevice(PreviewDevice(rawValue: "iPod gen 7"))
        //    .previewDisplayName("iPod 7")
        //    .environmentObject(TrailGame())
        ContentView()
            .previewDevice("iPhone SE (2nd generation)")
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            //.previewDisplayName("iPhone 12 Pro Max")
            .environmentObject(TrailGame())

    }
}
