//
//  RecentsGridView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct RecentsGridView: View {
    @EnvironmentObject var placementSettings: PlacementSettings
    @Binding var showBrowse: Bool
    
    var body: some View {
        if !placementSettings.recentlyPlaced.isEmpty {
            HorizontalGridView(showBrowse: $showBrowse, title: "Recents", items: getRecentsReversed())
        }
    }
    
    private func getRecentsReversed() -> [ARModel] {
        var recentsReversed: [ARModel] = []
        var modelName: Set<String> = []
        
        for model in placementSettings.recentlyPlaced.reversed()  {
            if !modelName.contains(model.name) {
                recentsReversed.append(model)
                modelName.insert(model.name)
            }
        }
    
        return recentsReversed
    }
}
