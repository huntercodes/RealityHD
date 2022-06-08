//
//  SettingsGridView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct SettingsGridView: View {
    @EnvironmentObject var sessionSettings: SessionSettings
    private let gridItemLayout = [GridItem(.adaptive(minimum: 100, maximum: 100), spacing: 25)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout, spacing: 25) {
                SettingsToggleButton(isOn: $sessionSettings.isPeopleOcclusionEnabled, settings: .peopleOcclusion)
                
                SettingsToggleButton(isOn: $sessionSettings.isObjectOcclusionEnabled, settings: .objectOcclusion)
                
                SettingsToggleButton(isOn: $sessionSettings.isLidarDebugEnabled, settings: .lidarDebug)
            }
        }
        .padding(.top, 25)
    }
}
