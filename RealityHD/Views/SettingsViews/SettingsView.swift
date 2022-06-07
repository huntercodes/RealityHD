//
//  SettingsView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct SettingsView: View {
    @Binding var showSettings: Bool
    
    var body: some View {
        NavigationView {
            SettingsGridView()
                .navigationBarTitle("Settings", displayMode: .inline)
                .navigationBarItems(
                    trailing: Button(action: { showSettings.toggle() },
                    label:{ Text("Done").foregroundColor(Color("mainColor")) }
                ))
        }
    }
}
