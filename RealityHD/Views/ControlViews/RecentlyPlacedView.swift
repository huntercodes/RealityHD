//
//  RecentlyPlacedView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//


import SwiftUI

struct RecentlyPlacedView: View {
    @EnvironmentObject var placementSettings: PlacementSettings

    var body: some View {
        Button {
            withAnimation(.easeInOut) { placementSettings.selectedModel = placementSettings.recentlyPlaced.last }
        } label: {
            if let recentlyPlacedModel = placementSettings.recentlyPlaced.last {
                recentlyPlacedModel.thumbnail
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60)
                    .aspectRatio(1/1, contentMode: .fit)
                    .cornerRadius(10)
            } else {
                Image(systemName: "clock.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(Color("mainColor"))
                .frame(width: 40, height: 40)
            }
        }
    }
}
