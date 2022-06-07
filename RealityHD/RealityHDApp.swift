//
//  RealityHDApp.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

@main
struct RealityHDApp: App {
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var sessionSettings = SessionSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
                .environmentObject(sessionSettings)
        }
    }
}
