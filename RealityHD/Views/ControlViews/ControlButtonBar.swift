//
//  ControlButtonBar.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//


import SwiftUI

struct ControlButtonBar: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    @Binding var showSettings: Bool
    
    var body: some View {
        HStack {
            RecentlyPlacedView()
                .hidden(placementSettings.recentlyPlaced.isEmpty)

            Spacer()
            
            ControlButtonView(name: "square.grid.2x2.fill") {
                showBrowse = true
            }
            .sheet(isPresented: $showBrowse) {
                BrowseView(showBrowse: $showBrowse)
            }
            
            Spacer()
            
            ControlButtonView(name: "slider.horizontal.3") {
                showSettings.toggle()
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(showSettings: $showSettings)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .padding(.bottom, 10)
        .background(.thinMaterial)
        .cornerRadius(30)
    }
}
