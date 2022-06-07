//
//  BrowseView.swift
//  RealityHD
//
//  Created by hunter downey on 6/6/22.
//

import SwiftUI

struct BrowseView: View {
    @Binding var showBrowse: Bool
            
    var body: some View {
        NavigationView {
            ScrollView {
                RecentsGridView(showBrowse: $showBrowse)
                
                ModelsGridView(showBrowse: $showBrowse)
            }
            .navigationBarTitle("Browse", displayMode: .inline)
            .navigationBarItems(
                trailing: Button(action: { showBrowse.toggle() },
                label:{ Text("Done").foregroundColor(Color("mainColor")) }
            ))
        }
    }
}
