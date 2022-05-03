//
//  TheTrailApp.swift
//  TheTrail
//
//  Created by Will Morrow on 9/14/21.
//

import SwiftUI

@main
struct TheTrailApp: App {
    @EnvironmentObject var game: TrailGame

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(TrailGame())
            //Hunt(hunt: HuntGame())
                .environmentObject(TrailGame())

        }
    }
}


